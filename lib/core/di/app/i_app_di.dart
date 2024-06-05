import '../module/di/i_module_di.dart';

abstract class IAppDi {
  IModuleDi get core;

  Map<AppModule, IModuleDi> get modules;

  IModuleDi get current;

  IModuleDi of(AppModule? module);
}
