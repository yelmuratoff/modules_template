import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../../shared/utils/throw_if_needed.dart';
import '../../../../../../shared/value_objects/auth_vo.dart';
import '../../../../../storage/secure/domain/i_secure_storage_repo.dart';
import '../interface/i_sign_out_repo.dart';
import 'state.dart';

export 'state.dart';

class RemoteAuthEntity extends Cubit<RemoteAuthState> {
  RemoteAuthEntity({
    required this.remote,
    required this.local,
  }) : super(RemoteAuthIdle());

  final ISecureStorageRepo local;
  final ISignOutRepo remote;

  final _prefKey = 'accessToken';

  Future<void> init() async {
    emit(RemoteAuthLoading());
    try {
      final token = await local.read(_prefKey);
      if (token == null) {
        emit(RemoteAuthSignedOut());
      } else {
        emit(
          RemoteAuthSignedIn(
            authVo: AuthVo(token: token),
          ),
        );
      }
    } catch (error, stack) {
      emit(
        RemoteAuthError(error),
      );
      throwIfNeeded(error, stack);
    }
  }

  Future<void> signOut() async {
    emit(RemoteAuthLoading());
    try {
      GoogleSignIn().isSignedIn().then((isSignedIn) {
        if (isSignedIn) {
          GoogleSignIn().disconnect();
        }
      });
      FacebookLogin().isLoggedIn.then((isLoggedIn) {
        if (isLoggedIn) {
          FacebookLogin().logOut();
        }
      });
      //TODO: enable remote sign out
      // await remote.signOut();
      await local.delete(_prefKey);
      emit(RemoteAuthSignedOut());
    } catch (error, stack) {
      emit(
        RemoteAuthError(error),
      );
      throwIfNeeded(error, stack);
    }
  }

  Future<void> updateAuthVo(
    AuthVo authVo, {
    bool forceReload = false,
  }) async {
    emit(
      RemoteAuthSignedIn(
        authVo: authVo,
        forceReload: forceReload,
      ),
    );
    if (authVo.token == null) return;
    await local.write(_prefKey, authVo.token!);
  }
}
