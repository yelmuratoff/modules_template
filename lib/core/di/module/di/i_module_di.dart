import '../../app/i_app_di.dart';
import '../dependencies/i_dependencies.dart';
import '../orchestrator/orchestrator_base.dart';

export '../switcher/domain/value_objects/app_module.dart';

///Base class for a module DI.\
///Provides a new [GetIt] instance and methods for init and reset.\
///Provides an instance of `Orchestrator`
///which is responsible for registration/dispose enities
///and corresponding interactors
abstract class IModuleDi {
  GetIt get = GetIt.asNewInstance();

  AppModule? get module;

  IAppDi get appDi;

  OrchestratorBase get orchestrator;

  List<IDependencies> get dependencies;

  Future<void> init() async {
    _registerRecursively(dependencies);
    await get.allReady();
    return orchestrator.init();
  }

  Future<void> dispose() async {
    await orchestrator.dispose();
    await get.reset();
  }

  Future<void> allReady() => get.allReady();

  void _registerRecursively(List<IDependencies> dependencies) {
    for (final dependency in dependencies) {
      dependency.register(appDi.core, appDi.of(module));
      _registerRecursively(dependency.dependencies);
    }
  }
}
