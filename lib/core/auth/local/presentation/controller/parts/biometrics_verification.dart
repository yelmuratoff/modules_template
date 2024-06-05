part of '../local_auth_controller.dart';

extension BiometricsVerification on LocalAuthController {
  Future<void> _biometricsVerification(
    LocalAuthDto dto,
    void Function(LocalAuthVmState) emit,
  ) async {
    if (!entity.availableBiometrics.isAnyAvailable) {
      unverified();
      return;
    }
    emit(
      LocalAuthVmBiometricsVerification(dto),
    );

    void emitError(String message) {
      emit(
        LocalAuthVmBiometricsVerification(
          dto.copyWith(
            errorMessage: message,
          ),
        ),
      );
    }

    var success = false;
    try {
      success = await entity.authenticate();
    } catch (e) {
      if (dto.switchToPinOnBiometricsError && entity.state.pin != null) {
        pinVerification(dto);
      } else {
        var errorMessage = defaultErrorMessage;
        if (e is LocalAuthException) errorMessage = e.message;
        emitError(errorMessage);
        return;
      }
    }
    if (success == true) {
      verified();
    } else {
      emitError('');
    }
  }
}
