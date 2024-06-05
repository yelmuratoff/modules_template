import 'package:flutter/foundation.dart';

import '../../domain/value_objects/local_auth_dto.dart';

@immutable
sealed class LocalAuthVmState {
  LocalAuthVmState([LocalAuthDto? dto]) : dto = dto ?? LocalAuthDto();

  final LocalAuthDto dto;

  @override
  bool operator ==(covariant LocalAuthVmState other) {
    if (identical(this, other)) return true;

    return (runtimeType == other.runtimeType) && other.dto == dto;
  }

  @override
  int get hashCode => dto.hashCode;

  // @override
  // String toString() => '$runtimeType($dto)';
}

class LocalAuthVmInitial extends LocalAuthVmState {}

class LocalAuthVmPinVerification extends LocalAuthVmState {
  LocalAuthVmPinVerification(super.dto);
}

class LocalAuthVmBiometricsVerification extends LocalAuthVmState {
  LocalAuthVmBiometricsVerification(super.dto);
}

class LocalAuthVmVerified extends LocalAuthVmState {}

class LocalAuthVmUnverified extends LocalAuthVmState {}

class LocalAuthVmPinSetupAsk extends LocalAuthVmState {
  LocalAuthVmPinSetupAsk(super.dto);
}

class LocalAuthVmPinSetupSetCode extends LocalAuthVmState {
  LocalAuthVmPinSetupSetCode(super.dto);
}

class LocalAuthVmPinSetupRepeatCode extends LocalAuthVmState {
  LocalAuthVmPinSetupRepeatCode(super.dto);
}

class LocalAuthVmError extends LocalAuthVmState {
  LocalAuthVmError(super.dto);
}

class LocalAuthVmBiometricsSetup extends LocalAuthVmState {
  LocalAuthVmBiometricsSetup(super.dto);
}

class LocalAuthVmPinForgot extends LocalAuthVmState {
  LocalAuthVmPinForgot(super.dto);
}
