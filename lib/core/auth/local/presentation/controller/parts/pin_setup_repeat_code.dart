part of '../local_auth_controller.dart';

extension PinSetupRepeatCode on LocalAuthController {
  Future<void> _pinSetupRepeatCode(
    LocalAuthDto dto,
    void Function(LocalAuthVmState) emit,
  ) async {
    emit(
      LocalAuthVmPinSetupRepeatCode(dto),
    );
  }
}
