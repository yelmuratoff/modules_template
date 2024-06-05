import '../../../../../core/di/module/di/i_module_di.dart';
import '../../../../../core/env/domain/entity/interactor.dart';
import '../../../backend/two_backend.dart';

abstract class EnvTypePart {
  static EnvTypeInteractor get(IModuleDi coreDi, IModuleDi moduleDi) {
    return EnvTypeInteractor(
      entity: coreDi.get(),
      onChange: (envType) {
        moduleDi.get<TwoBackend>().updateEnvType(envType);
        moduleDi.orchestrator.loadAllData();
      },
    );
  }
}
