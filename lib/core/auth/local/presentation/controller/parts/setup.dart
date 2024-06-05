part of '../local_auth_controller.dart';

extension Setup on LocalAuthController {
  Future<void> _setup(
    LocalAuthDto dto,
    void Function(LocalAuthVmState) emit,
  ) async {
    if (dto.modes.isEmpty) {
      verified();
      return;
    }
    if (dto.modes.first == LocalAuthMode.pin) {
      if (dto.skipAsk) {
        emit(
          LocalAuthVmPinSetupSetCode(
            dto.copyWith(
              modes: dto.modes.toSet()
                ..add(
                  LocalAuthMode.pin,
                ),
            ),
          ),
        );
      } else {
        emit(
          LocalAuthVmPinSetupAsk(
            dto.copyWith(
              modes: dto.modes.toSet()
                ..add(
                  LocalAuthMode.pin,
                ),
            ),
          ),
        );
      }
    } else if (dto.modes.first == LocalAuthMode.biometrics) {
      biometricsSetup(dto);
    }
  }
}
