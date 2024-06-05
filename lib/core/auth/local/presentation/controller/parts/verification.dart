part of '../local_auth_controller.dart';

extension Verification on LocalAuthController {
  Future<void> _verification(
    LocalAuthDto dto,
    void Function(LocalAuthVmState) emit,
  ) async {
    final isBiometricsOn = entity.state.isBiometricsOn ?? false;
    final isAnyBiometricsAvailable = entity.availableBiometrics.isAnyAvailable;
    if (isBiometricsOn && isAnyBiometricsAvailable) {
      biometricsVerification(dto);
    } else if (entity.state.pin != null) {
      pinVerification(dto);
    } else {
      verified();
    }
  }
}
