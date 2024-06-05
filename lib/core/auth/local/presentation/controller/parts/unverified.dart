part of '../local_auth_controller.dart';

extension Unverified on LocalAuthController {
  Future<void> _unverified(
    void Function(LocalAuthVmState) emit,
  ) async {
    emit(LocalAuthVmUnverified());
    onComplete();
  }
}
