import '../../../../../core/di/module/dependencies/i_dependencies.dart';
import '../../../backend/two_backend.dart';
import '../../list/data/repo/quotes_repo.dart';
import '../../list/domain/entity/quotes_entity.dart';

class QuotesDeps extends IDependencies {
  @override
  void register(IModuleDi coreDi, IModuleDi moduleDi) {
    moduleDi.get.registerLazySingleton(
      () => QuotesEntity(
        remote: QuotesRepo(
          moduleDi.get<TwoBackend>().gateway,
        ),
      ),
      dispose: (instance) => instance.close(),
    );
  }
}
