import 'dart:async';

import '../value_objects/app_module.dart';

abstract class IModuleRepo {
  Future<AppModule?> read();

  Future<void> write(AppModule module);
}
