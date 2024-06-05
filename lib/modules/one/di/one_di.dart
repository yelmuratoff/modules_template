import '../../../core/di/app/i_app_di.dart';
import '../products/_shared/di/products_deps.dart';
import '../profile/di/profile_deps.dart';
import '../recipes/_shared/di/recipes_deps.dart';
import 'one_dependencies.dart';
import 'orchestrator/one_orchestrator.dart';

class OneDi extends IModuleDi {
  OneDi(this.appDi, this.module);

  @override
  final IAppDi appDi;

  @override
  final dependencies = [
    OneDependencies(),
    RecipesDeps(),
    ProductsDeps(),
    ProfileDeps(),
  ];

  @override
  late final orchestrator = OneOrchestrator(appDi.core, this);

  @override
  final AppModule module;
}
