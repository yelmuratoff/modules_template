part of '../local_auth_controller.dart';

extension PinSetupComplete on LocalAuthController {
  Future<void> _pinSetupComplete(
    LocalAuthDto dto,
    void Function(LocalAuthVmState) emit,
  ) async {
    try {
      entity
        ..update(pin: dto.pin)
        ..changeAuthStateTo(true);
    } catch (_) {
      emit(
        LocalAuthVmError(
          dto.copyWith(
            errorMessage: defaultErrorMessage,
          ),
        ),
      );
      rethrow;
    }

    final modes = dto.modes.toSet()..remove(LocalAuthMode.pin);
    setup(
      dto.copyWith(modes: modes),
    );
  }
}
