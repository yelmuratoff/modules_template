import '../../../auth/combined/domain/entity/auth_entity.dart';
import '../../../auth/local/domain/entity/local_auth_entity.dart';
import '../../../auth/remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../env_type/domain/entity/env_type_entity.dart';
import '../../../l10n/domain/entity/locale_entity.dart';
import '../di/i_module_di.dart';
import '../switcher/domain/entity/module_entity.dart';
import 'interactors/locale.dart';

import 'interactors/remote_auth.dart';
import 'interactors/env_type.dart';
import 'interactors/sign_out.dart';
import 'orchestrator_base.dart';

final class CoreOrchestrator extends OrchestratorBase {
  CoreOrchestrator(IModuleDi coreDi) : super(coreDi, coreDi);

  @override
  Future<void> init() async {
    await coreDi.get<LocaleEntity>().init();
    coreDi.get<AuthEntity>().init();
    interactors.addAll([
      RemoteAuthPart.get(coreDi),
      EnvTypePart.get(coreDi),
      LocalePart.get(coreDi),
      SignOutPart.get(coreDi),
    ]);
    await coreDi.get<ModuleEntity>().read();
    await coreDi.get<EnvTypeEntity>().read();
    coreDi.get<RemoteAuthEntity>().init();
    await coreDi.get<LocalAuthEntity>().init();
  }
}
