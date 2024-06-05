part of '../local_auth_entity.dart';

extension Init on LocalAuthEntity {
  Future _init(ValueChanged<LocalAuthState> emit) async {
    WidgetsBinding.instance.addObserver(this);
    var newState = state;

    final pin = await _local.read(_Fields.pin.name);
    newState = newState.copyWith(pin: pin);

    final isBiometricsOnString = await _local.read(
      _Fields.isEnabledBiometrics.name,
    );

    availableBiometrics ??= await getAvailableBiometrics(_localAuth);
    if (isBiometricsOnString == 'true') {
      newState = newState.copyWith(
        isBiometricsOn: availableBiometrics!.isNotEmpty,
      );
    } else if (isBiometricsOnString == 'false') {
      newState = newState.copyWith(isBiometricsOn: false);
    }
    newState = newState.copyWith(isInitCompleted: true);
    emit(newState);
  }
}
