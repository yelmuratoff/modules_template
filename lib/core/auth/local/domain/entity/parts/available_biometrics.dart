part of '../local_auth_entity.dart';

mixin AvailableBiometrics {
  Future<List<BiometricsType>> getAvailableBiometrics(LocalAuthentication localAuth) async {
    final types = <BiometricsType>[];
    final isDeviceSupported = await localAuth.isDeviceSupported();
    final canCheckBiometrics = await localAuth.canCheckBiometrics;
    if (isDeviceSupported && canCheckBiometrics) {
      final availableBiometrics = await localAuth.getAvailableBiometrics();
      if (availableBiometrics.contains(BiometricType.face)) {
        types.add(BiometricsType.faceId);
      }
      if (availableBiometrics.any((item) => item != BiometricType.face)) {
        types.add(BiometricsType.fingerprint);
      }
    }
    return types;
  }
}
