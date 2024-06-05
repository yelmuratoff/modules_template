import '../../../../core/di/module/dependencies/i_dependencies.dart';
import '../../backend/one_backend.dart';
import '../data/repo/user_repo.dart';
import '../domain/entity/user_entity.dart';

class ProfileDeps extends IDependencies {
  @override
  void register(IModuleDi coreDi, IModuleDi moduleDi) {
    moduleDi.get.registerSingletonWithDependencies<UserEntity>(
      () => UserEntity(
        remote: UserRepo(
          gateway: moduleDi.get<OneBackend>().gateway,
        ),
      ),
      dependsOn: [OneBackend],
      dispose: (instance) => instance.close(),
    );
  }
}
