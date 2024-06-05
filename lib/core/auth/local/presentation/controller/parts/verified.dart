part of '../local_auth_controller.dart';

extension Verified on LocalAuthController {
  Future<void> _verified(
    void Function(LocalAuthVmState) emit,
  ) async {
    entity.changeAuthStateTo(true);
    emit(LocalAuthVmVerified());
    onComplete();
  }
}
