import '../../../../../core/_shared/app_global_keys.dart';
import '../../../../../core/di/module/di/i_module_di.dart';
import '../../../../../core/navigation/navigator1_helper.dart';
import '../../../../../core/network/backend/domain/entity/interactor.dart';
import '../../../backend/two_backend.dart';

abstract class BackendPart {
  static BackendInteractor get(IModuleDi moduleDi) {
    return BackendInteractor(
      backend: moduleDi.get<TwoBackend>(),
      onError: (error) {
        AppGlobalKeys.navigator.currentState?.use.pushSignOutScreen();
      },
    );
  }
}
