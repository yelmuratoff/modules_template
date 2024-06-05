import '../../../core/di/app/i_app_di.dart';
import '../../../core/di/module/di/i_module_di.dart';
import '../profile/di/profile_deps.dart';
import '../quotes/_shared/di/quotes_di.dart';
import 'orchestrator/two_orchestrator.dart';
import 'two_dependencies.dart';

class TwoDi extends IModuleDi {
  TwoDi(this.appDi, this.module);

  @override
  final IAppDi appDi;

  @override
  final dependencies = [
    TwoDependencies(),
    QuotesDeps(),
    ProfileDeps(),
  ];

  @override
  late final orchestrator = TwoOrchestrator(appDi.core, this);

  @override
  final AppModule module;
}
