import '../../../../../core/di/module/di/i_module_di.dart';
import '../../../../../core/l10n/domain/entity/interactor.dart';
import '../../../backend/one_backend.dart';

abstract class LocalePart {
  static LocaleInteractor get(IModuleDi coreDi, IModuleDi moduleDi) {
    return LocaleInteractor(
      entity: coreDi.get(),
      onLocaleChange: (locale) {
        moduleDi.get<OneBackend>().updateLocaleCode(locale?.code);
        moduleDi.orchestrator.loadAllData();
      },
    );
  }
}
