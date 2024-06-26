import '../../../../../shared/utils/app_global_keys.dart';
import '../../../../../core/di/module/di/i_module_di.dart';
import '../../../../../core/router/navigator1_helper.dart';
import '../../../../../core/api/backend/domain/entity/interactor.dart';
import '../../../backend/one_backend.dart';

abstract class BackendPart {
  static BackendInteractor get(IModuleDi coreDi, IModuleDi moduleDi) {
    return BackendInteractor(
      backend: moduleDi.get<OneBackend>(),
      onError: (error) {
        AppGlobalKeys.navigator.currentState?.use.pushSignOutScreen();
      },
    );
  }
}
