import '../../../../_shared/utils/throw_if_needed.dart';
import '../../../../auth/remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../../auth/remote/_shared/domain/sign_out_entity/interactor.dart';
import '../../../../auth/remote/_shared/domain/sign_out_entity/sign_out_entity.dart';
import '../../di/i_module_di.dart';

abstract class SignOutPart {
  static SignOutInteractor get(IModuleDi coreDi) {
    return SignOutInteractor(
      entity: coreDi.get(),
      onSignOutRequest: () async {
        try {
          await coreDi.get<RemoteAuthEntity>().signOut();
          Future.delayed(
            const Duration(milliseconds: 500),
            () {
              coreDi.get<SignOutEntity>().add(
                    EmitSuccessOfSignOut(),
                  );
            },
          );
        } catch (error, stack) {
          coreDi.get<SignOutEntity>().add(
                EmitErrorOfSignOut(error),
              );
          throwIfNeeded(error, stack);
        }
      },
    );
  }
}
