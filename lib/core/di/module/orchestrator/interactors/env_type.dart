import '../../../../network/backend/domain/entity/core_backend.dart';
import '../../../../env_type/domain/entity/interactor.dart';
import '../../di/i_module_di.dart';

abstract class EnvTypePart {
  static EnvTypeInteractor get(IModuleDi coreDi) {
    return EnvTypeInteractor(
      entity: coreDi.get(),
      onChange: (envType) {
        coreDi.get<CoreBackend>().updateEnvType(envType);
      },
    );
  }
}
