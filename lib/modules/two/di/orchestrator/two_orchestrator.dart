import 'dart:async';

import '../../../../core/auth/remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../../core/di/module/orchestrator/orchestrator_base.dart';
import '../../../../core/theme/domain/entity/theme_entity.dart';
import '../../profile/domain/entity/user_entity.dart';
import '../../quotes/list/domain/entity/quotes_entity.dart';
import 'interactors/backend.dart';
import 'interactors/env_type.dart';
import 'interactors/locale.dart';

import 'interactors/remote_auth.dart';
import 'interactors/user_part.dart';

final class TwoOrchestrator extends OrchestratorBase {
  TwoOrchestrator(super.coreDi, super.moduleDi);

  @override
  Future<void> init() async {
    interactors.addAll([
      RemoteAuthPart.get(coreDi, moduleDi),
      EnvTypePart.get(coreDi, moduleDi),
      LocalePart.get(coreDi, moduleDi),
      UserPart.get(moduleDi),
      BackendPart.get(moduleDi),
    ]);
    moduleDi.get<ThemeEntity>().add(InitTheme());
    loadAllData();
  }

  @override
  Future<void> loadProtectedData() async {
    if (coreDi.get<RemoteAuthEntity>().state.authVo == null) return;
    moduleDi.get<UserEntity>().read();
    moduleDi.get<QuotesEntity>().add(ReadQuotes());
  }
}
