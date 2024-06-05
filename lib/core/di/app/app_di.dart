import '../../../modules/one/di/one_di.dart';
import '../../../modules/two/di/two_di.dart';
import '../module/di/core_di.dart';
import '../module/di/i_module_di.dart';
import '../module/switcher/domain/entity/module_entity.dart';
import 'i_app_di.dart';

class AppDi implements IAppDi {
  @override
  late final IModuleDi core = CoreDi(this);

  @override
  final Map<AppModule, IModuleDi> modules = {};

  @override
  IModuleDi get current => of(
        core.get<ModuleEntity>().state.module,
      );

  @override
  IModuleDi of(AppModule? module) {
    if (module == null) return core;
    return modules[module]!;
  }

  IModuleDi createDiFor(AppModule module) {
    return switch (module) {
      AppModule.one => OneDi(this, module),
      AppModule.two => TwoDi(this, module),
    };
  }
}
