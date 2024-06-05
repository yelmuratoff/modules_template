import '../../app/i_app_di.dart';
import '../dependencies/core_dependencies.dart';
import '../orchestrator/core_orchestrator.dart';
import 'i_module_di.dart';

class CoreDi extends IModuleDi {
  CoreDi(this.appDi);

  @override
  final IAppDi appDi;

  @override
  final dependencies = [CoreDependencies()];

  @override
  late final orchestrator = CoreOrchestrator(appDi.core);

  @override
  AppModule? get module => null;
}
