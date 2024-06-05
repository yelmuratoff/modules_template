import '../../../../../core/di/module/dependencies/i_dependencies.dart';
import '../../../backend/one_backend.dart';
import '../../list/data/repo/recipes_repo.dart';
import '../../list/domain/entity/recipes_entity.dart';

class RecipesDeps extends IDependencies {
  @override
  void register(IModuleDi coreDi, IModuleDi moduleDi) {
    moduleDi.get.registerLazySingleton<RecipesEntity>(
      () => RecipesEntity(
        remote: RecipesRepo(
          moduleDi.get<OneBackend>().gateway,
        ),
      ),
      dispose: (instance) => instance.close(),
    );
  }
}
