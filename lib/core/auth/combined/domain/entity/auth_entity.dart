import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../local/domain/entity/local_auth_entity.dart';
import '../../../remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import 'state.dart';

export 'state.dart';

class AuthEntity extends Cubit<AuthState> {
  AuthEntity({
    required this.remote,
    required this.local,
  }) : super(AuthState());

  final LocalAuthEntity local;
  final RemoteAuthEntity remote;

  Future<AuthState> authState() async {
    if (!state.localIsLoading && !state.remoteIsLoading) return state;
    return stream.firstWhere(
      (event) => !event.localIsLoading && !event.remoteIsLoading,
    );
  }

  Future<void> init() async {
    local.stream.listen((event) {
      if (!event.isInitCompleted) {
        emit(
          state.copyWith(localIsLoading: true),
        );
      } else {
        emit(
          state.copyWith(
            localIsLoading: false,
            local: event.isAuthorized,
          ),
        );
      }
    });

    remote.stream.listen((event) {
      final isAuthorized = switch (event) {
        RemoteAuthError _ => false,
        RemoteAuthSignedOut _ => false,
        RemoteAuthSignedIn _ => true,
        _ => null,
      };
      if (isAuthorized == null) {
        emit(
          state.copyWith(remoteIsLoading: true),
        );
      } else {
        emit(
          state.copyWith(
            remoteIsLoading: false,
            remote: isAuthorized,
          ),
        );
      }
    });
  }
}
