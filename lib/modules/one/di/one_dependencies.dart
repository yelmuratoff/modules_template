import '../../../core/auth/remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../core/di/module/dependencies/i_dependencies.dart';
import '../../../core/env_type/domain/entity/env_type_entity.dart';
import '../../../core/l10n/domain/entity/locale_entity.dart';
import '../../../core/storage/general/domain/interface/i_local_storage_repo.dart';
import '../../../core/theme/domain/entity/theme_entity.dart';
import '../backend/one_backend.dart';
import '../settings/domain/entity/settings_entity.dart';
import '../theme/themes/default/one_theme.dart';
import '../theme/themes/purple/purple_theme.dart';

class OneDependencies extends IDependencies {
  @override
  void register(IModuleDi coreDi, IModuleDi moduleDi) {
    moduleDi.get
      ..registerLazySingleton(
        () => ThemeEntity(
          module: moduleDi.module!,
          themes: [
            OneTheme(),
            PurpleTheme(),
          ],
          local: coreDi.get<ILocalStorageRepo>(),
        ),
        dispose: (instance) => instance.close(),
      )
      ..registerSingletonAsync<OneBackend>(
        () async => OneBackend(
          initialEnvType: coreDi.get<EnvTypeEntity>().state.envType,
          initialLocale: coreDi.get<LocaleEntity>().state.locale,
          initialAuthVo: coreDi.get<RemoteAuthEntity>().state.authVo,
        ),
        dispose: (instance) => instance.dispose(),
      )
      ..registerLazySingleton<SettingsEntity>(
        () => SettingsEntity(
          local: coreDi.get<ILocalStorageRepo>(),
        ),
        dispose: (instance) {
          instance.reset();
          return instance.close();
        },
      );
  }
}
