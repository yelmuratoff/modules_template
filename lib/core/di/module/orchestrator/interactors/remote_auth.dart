import 'package:sc_logger/sc_logger.dart';

import '../../../../auth/local/domain/entity/local_auth_entity.dart';
import '../../../../auth/remote/_shared/domain/remote_auth_entity/interactor.dart';
import '../../../../network/backend/domain/entity/core_backend.dart';
import '../../di/i_module_di.dart';

abstract class RemoteAuthPart {
  static RemoteAuthInteractor get(IModuleDi coreDi) {
    return RemoteAuthInteractor(
      entity: coreDi.get(),
      onSignIn: (vo) {
        Log.w(vo.token, 'Token');
        coreDi.get<CoreBackend>().updateAuthVo(vo);
      },
      onUpdate: (state) {
        Log.w(state.authVo, 'Token');
        coreDi.get<CoreBackend>().updateAuthVo(state.authVo);
      },
      onSignOut: () {
        coreDi.get<LocalAuthEntity>().reset();
        coreDi.get<CoreBackend>().updateAuthVo(null);
      },
    );
  }
}