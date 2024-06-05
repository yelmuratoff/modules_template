// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/local_auth_entity.dart';
import '../../domain/exceptions/local_auth_exception.dart';
import '../../domain/value_objects/biometrics_type.dart';
import '../../domain/value_objects/local_auth_dto.dart';
import 'states.dart';

export 'states.dart';

part 'parts/biometrics_setup.dart';
part 'parts/biometrics_verification.dart';
part 'parts/pin_forgot.dart';
part 'parts/pin_setup_complete.dart';
part 'parts/pin_setup_repeat_code.dart';
part 'parts/pin_setup_set_code.dart';
part 'parts/pin_verification.dart';
part 'parts/setup.dart';
part 'parts/unverified.dart';
part 'parts/verification.dart';
part 'parts/verified.dart';

class LocalAuthController extends Cubit<LocalAuthVmState> {
  LocalAuthController({
    required this.entity,
    required this.onComplete,
    required this.defaultErrorMessage,
  }) : super(LocalAuthVmInitial());

  final String defaultErrorMessage;

  VoidCallback onComplete;

  late final LocalAuthEntity entity;

  List<BiometricsType>? get availableBiometrics => entity.availableBiometrics;

  void setup(LocalAuthDto dto) => _setup(dto, emit);

  void unverified() => _unverified(emit);

  void verified() => _verified(emit);

  void pinVerification(LocalAuthDto dto) => _pinVerification(dto, emit);

  void pinForgot(LocalAuthDto dto) => _pinForgot(dto, emit);

  void pinSetupComplete(LocalAuthDto dto) => _pinSetupComplete(dto, emit);

  void pinSetupRepeatCode(LocalAuthDto dto) => _pinSetupRepeatCode(dto, emit);

  void pinSetupSetCode(LocalAuthDto dto) => _pinSetupSetCode(dto, emit);

  void verification(LocalAuthDto dto) => _verification(dto, emit);

  void biometricsVerification(LocalAuthDto dto) => _biometricsVerification(dto, emit);

  void biometricsSetup(LocalAuthDto dto) => _biometricsSetup(dto, emit);
}
