// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/error_codes.dart' as error_codes;
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

import '../../../../l10n/generated/l10n.dart';
import '../../../../storage/secure/domain/i_secure_storage_repo.dart';
import '../exceptions/local_auth_exception.dart';
import '../value_objects/biometrics_type.dart';
import 'state.dart';

export 'extensions.dart';
export 'state.dart';

part 'parts/authenticate.dart';
part 'parts/available_biometrics.dart';
part 'parts/init.dart';
part 'parts/update.dart';

class LocalAuthEntity extends Cubit<LocalAuthState> with WidgetsBindingObserver, AvailableBiometrics, Authenticate {
  LocalAuthEntity({
    required ISecureStorageRepo local,
    this.idleDuration,
  })  : _local = local,
        super(
          const LocalAuthState(),
        );

  List<BiometricsType>? availableBiometrics;
  Duration? idleDuration;
  Timer? timer;

  late final ISecureStorageRepo _local;
  final _localAuth = LocalAuthentication();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (idleDuration == null) return;
    //foreground
    if (state == AppLifecycleState.detached || state == AppLifecycleState.resumed) {
      timer?.cancel();
      //background
    } else if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      timer = Timer(
        idleDuration!,
        () {
          changeAuthStateTo(false);
        },
      );
    }
  }

  void changeAuthStateTo(bool value) {
    emit(
      state.copyWith(isAuthorized: value),
    );
  }

  ///can throw LocalAuthException`
  Future<bool> authenticate() => _authenticate(_localAuth);

  Future init() => _init(emit);

  Future reset() async {
    changeAuthStateTo(false);
    await _local.delete(_Fields.pin.name);
    await _local.delete(_Fields.isEnabledBiometrics.name);
    emit(const LocalAuthState(isInitCompleted: true));
  }

  Future update({String? pin, bool? isBiometricsOn}) {
    return _update(pin, isBiometricsOn, emit);
  }
}

enum _Fields { isEnabledBiometrics, pin }
