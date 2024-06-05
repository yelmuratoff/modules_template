import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../_shared/value_objects/auth_vo.dart';
import '../../../auth/combined/domain/entity/auth_entity.dart';
import '../../../auth/local/domain/entity/local_auth_entity.dart';
import '../../../auth/remote/_shared/data/sign_out_repo.dart';
import '../../../auth/remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../auth/remote/_shared/domain/sign_out_entity/sign_out_entity.dart';
import '../../../env/data/repo/env_type_repo.dart';
import '../../../env/domain/entity/env_type_entity.dart';

import '../../../l10n/domain/entity/locale_entity.dart';
import '../../../network/backend/domain/entity/core_backend.dart';
import '../../../storage/general/data/local_storage_repo.dart';
import '../../../storage/general/domain/interface/i_local_storage_repo.dart';
import '../../../storage/secure/data/secure_storage_repo.dart';
import '../../../storage/secure/domain/i_secure_storage_repo.dart';
import '../switcher/data/repo/module_repo.dart';
import '../switcher/domain/entity/module_entity.dart';
import 'i_dependencies.dart';

class CoreDependencies extends IDependencies {
  @override
  void register(IModuleDi coreDi, IModuleDi moduleDi) {
    coreDi.get
      ..registerSingletonAsync<ILocalStorageRepo>(
        () async => LocalStorageRepo(
          await SharedPreferences.getInstance(),
        ),
      )
      ..registerSingletonWithDependencies(
        () => LocaleEntity(
          local: coreDi.get<ILocalStorageRepo>(),
        ),
        dependsOn: [ILocalStorageRepo],
      )
      ..registerSingletonWithDependencies(
        () => ModuleEntity(
          local: ModuleRepo(
            storage: coreDi.get<ILocalStorageRepo>(),
          ),
        ),
        dependsOn: [ILocalStorageRepo],
      )
      ..registerSingletonWithDependencies(
        () => EnvTypeEntity(
          local: EnvTypeRepo(
            storage: coreDi.get<ILocalStorageRepo>(),
          ),
        ),
        dependsOn: [ILocalStorageRepo],
      )
      ..registerSingletonWithDependencies(
        () => CoreBackend(
          initialEnvType: coreDi.get<EnvTypeEntity>().state.envType,
          initialLocale: coreDi.get<LocaleEntity>().state.locale,
          initialAuthVo: const AuthVo.empty(),
        ),
        dependsOn: [EnvTypeEntity, LocaleEntity],
      )
      ..registerSingletonAsync<ISecureStorageRepo>(
        () async => const SecureStorageRepo(
          FlutterSecureStorage(
            aOptions: AndroidOptions(
              encryptedSharedPreferences: true,
            ),
          ),
        ),
      )
      ..registerSingletonWithDependencies(
        () => LocalAuthEntity(
          local: coreDi.get<ISecureStorageRepo>(),
        ),
        dependsOn: [ISecureStorageRepo],
      )
      ..registerSingletonWithDependencies(
        () => RemoteAuthEntity(
          local: coreDi.get<ISecureStorageRepo>(),
          remote: SignOutRepo(
            gateway: coreDi.get<CoreBackend>().gateway,
          ),
        ),
        dependsOn: [CoreBackend],
      )
      ..registerSingletonWithDependencies(
        () => AuthEntity(
          local: coreDi.get<LocalAuthEntity>(),
          remote: coreDi.get<RemoteAuthEntity>(),
        ),
        dependsOn: [RemoteAuthEntity, LocalAuthEntity],
      )
      ..registerLazySingleton(
        () => SignOutEntity(
          remote: SignOutRepo(
            gateway: coreDi.get<CoreBackend>().gateway,
          ),
        ),
      );
  }
}
