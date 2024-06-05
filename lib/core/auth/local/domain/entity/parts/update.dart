part of '../local_auth_entity.dart';

extension Update on LocalAuthEntity {
  Future _update(
    String? pin,
    bool? isBiometricsOn,
    ValueChanged<LocalAuthState> emit,
  ) async {
    var newState = state;
    if (pin != null) {
      await _local.write(_Fields.pin.name, pin);
      newState = newState.copyWith(pin: pin);
    }

    if (isBiometricsOn == false) {
      await _local.write(
        _Fields.isEnabledBiometrics.name,
        'false',
      );
      newState = newState.copyWith(
        isBiometricsOn: false,
      );
    } else if (isBiometricsOn == true) {
      if (availableBiometrics!.isEmpty) {
        newState = newState.copyWith(
          isBiometricsOn: false,
        );
      } else {
        await _local.write(
          _Fields.isEnabledBiometrics.name,
          'true',
        );
        newState = newState.copyWith(
          isBiometricsOn: true,
        );
      }
    }
    emit(newState);
  }
}
