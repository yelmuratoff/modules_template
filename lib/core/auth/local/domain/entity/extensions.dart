import '../value_objects/biometrics_type.dart';

extension BiometricsTypeUtils on List<BiometricsType>? {
  bool get isAnyAvailable => this?.isNotEmpty ?? false;
  BiometricsType? get current {
    if (this == null) return null;
    if (this!.contains(BiometricsType.faceId)) {
      return BiometricsType.faceId;
    } else if (this!.contains(BiometricsType.fingerprint)) {
      return BiometricsType.fingerprint;
    }
    return null;
  }
}
