import '../../../../../core/di/module/di/i_module_di.dart';
import '../../../../../core/env_type/domain/entity/interactor.dart';
import '../../../backend/one_backend.dart';

abstract class EnvTypePart {
  static EnvTypeInteractor get(IModuleDi coreDi, IModuleDi moduleDi) {
    return EnvTypeInteractor(
      entity: coreDi.get(),
      onChange: (envType) {
        moduleDi.get<OneBackend>().updateEnvType(envType);
        moduleDi.orchestrator.loadAllData();
      },
    );
  }
}
