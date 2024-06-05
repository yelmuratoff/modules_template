import 'dart:async';

import '../value_objects/env_type.dart';

abstract class IEnvTypeRepo {
  Future<EnvType?> read();

  Future<void> write(EnvType type);
}
