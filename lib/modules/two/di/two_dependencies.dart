import '../../../core/auth/remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../core/di/module/dependencies/i_dependencies.dart';
import '../../../core/env_type/domain/entity/env_type_entity.dart';
import '../../../core/l10n/domain/entity/locale_entity.dart';
import '../../../core/storage/general/domain/interface/i_local_storage_repo.dart';
import '../../../core/theme/domain/entity/theme_entity.dart';
import '../backend/two_backend.dart';
import '../profile/data/repo/user_repo.dart';
import '../profile/domain/entity/user_entity.dart';
import '../theme/themes/default/two_theme.dart';
import '../theme/themes/green/green_theme.dart';

class TwoDependencies extends IDependencies {
  @override
  void register(IModuleDi coreDi, IModuleDi moduleDi) {
    moduleDi.get
      ..registerLazySingleton(
        () => ThemeEntity(
          module: moduleDi.module!,
          themes: [
            TwoTheme(),
            GreenTheme(),
          ],
          local: coreDi.get<ILocalStorageRepo>(),
        ),
        dispose: (instance) => instance.close(),
      )
      ..registerSingleton<TwoBackend>(
        TwoBackend(
          initialEnvType: coreDi.get<EnvTypeEntity>().state.envType,
          initialLocale: coreDi.get<LocaleEntity>().state.locale,
          initialAuthVo: coreDi.get<RemoteAuthEntity>().state.authVo,
        ),
        dispose: (instance) => instance.dispose(),
      )
      ..registerLazySingleton<UserEntity>(
        () => UserEntity(
          remote: UserRepo(
            gateway: moduleDi.get<TwoBackend>().gateway,
          ),
        ),
        dispose: (instance) => instance.close(),
      );
  }
}
