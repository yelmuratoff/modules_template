import '../../../../../core/di/module/dependencies/i_dependencies.dart';
import '../../../backend/one_backend.dart';
import '../../list/data/repo/products_repo.dart';
import '../../list/domain/entity/products_entity.dart';

class ProductsDeps extends IDependencies {
  @override
  void register(IModuleDi coreDi, IModuleDi moduleDi) {
    moduleDi.get.registerLazySingleton<ProductsEntity>(
      () => ProductsEntity(
        remote: ProductsRepo(
          moduleDi.get<OneBackend>().gateway,
        ),
      ),
      dispose: (instance) => instance.close(),
    );
  }
}
