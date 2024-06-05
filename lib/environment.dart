import 'core/di/module/switcher/domain/value_objects/app_module.dart';
import 'core/env_type/domain/value_objects/env_type.dart';
import 'core/l10n/domain/value_objects/app_locale.dart';

final class Environment {
  static EnvType _envType = EnvType.dev;
  static EnvType get envType => _envType;

  static AppLocale _locale = AppLocale.ru;
  static AppLocale get locale => _locale;

  static AppModule _module = AppModule.one;
  static AppModule get module => _module;

  static late final Uri Function(EnvType type) coreUri;
  static late final Uri Function(AppModule module, EnvType type) moduleUri;

  static void setup({
    required EnvType envType,
    required AppLocale locale,
    required AppModule module,
    required Uri Function(EnvType type) coreUri,
    required Uri Function(AppModule module, EnvType type) moduleUri,
  }) {
    Environment._envType = envType;
    Environment._locale = locale;
    Environment._module = module;
    Environment.coreUri = coreUri;
    Environment.moduleUri = moduleUri;
  }
}
