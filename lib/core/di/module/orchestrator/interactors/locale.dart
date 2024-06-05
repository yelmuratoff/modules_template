import '../../../../l10n/domain/entity/interactor.dart';
import '../../../../network/backend/domain/entity/core_backend.dart';
import '../../di/i_module_di.dart';

abstract class LocalePart {
  static LocaleInteractor get(IModuleDi coreDi) {
    return LocaleInteractor(
      entity: coreDi.get(),
      onLocaleChange: (locale) {
        coreDi.get<CoreBackend>().updateLocaleCode(locale?.code);
      },
    );
  }
}
