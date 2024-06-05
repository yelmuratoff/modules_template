part of '../local_auth_controller.dart';

extension PinForgot on LocalAuthController {
  Future<void> _pinForgot(
    LocalAuthDto dto,
    void Function(LocalAuthVmState) emit,
  ) async {
    emit(LocalAuthVmPinForgot(dto));
  }
}
