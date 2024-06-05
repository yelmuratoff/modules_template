part of '../local_auth_controller.dart';

extension PinSetupSetCode on LocalAuthController {
  Future<void> _pinSetupSetCode(
    LocalAuthDto dto,
    void Function(LocalAuthVmState) emit,
  ) async {
    emit(
      LocalAuthVmPinSetupSetCode(dto),
    );
  }
}
