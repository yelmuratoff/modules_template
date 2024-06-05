import '../../../../../core/auth/remote/_shared/domain/remote_auth_entity/interactor.dart';
import '../../../../../core/di/module/di/i_module_di.dart';
import '../../../backend/one_backend.dart';

abstract class RemoteAuthPart {
  static RemoteAuthInteractor get(IModuleDi coreDi, IModuleDi moduleDi) {
    return RemoteAuthInteractor(
      entity: coreDi.get(),
      onSignIn: (authVo) {
        moduleDi.get<OneBackend>().updateAuthVo(authVo);
        moduleDi.orchestrator.initData();
        moduleDi.orchestrator.loadAllData();
      },
      onUpdate: (state) {
        moduleDi.get<OneBackend>().updateAuthVo(state.authVo);
        if (state.forceReload) {
          moduleDi.orchestrator.initData();
          moduleDi.orchestrator.loadAllData();
        }
      },
    );
  }
}
