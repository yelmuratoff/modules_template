import 'dart:async';

import '../../../../core/auth/remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../../core/di/module/orchestrator/orchestrator_base.dart';
import '../../../../core/theme/domain/entity/theme_entity.dart';
import '../../products/list/domain/entity/products_entity.dart';
import '../../profile/domain/entity/user_entity.dart';
import '../../recipes/list/domain/entity/recipes_entity.dart';
import '../../settings/domain/entity/settings_entity.dart';
import 'interactors/backend.dart';
import 'interactors/env_type.dart';
import 'interactors/locale.dart';

import 'interactors/remote_auth.dart';
import 'interactors/user.dart';

export '../../../../core/di/module/di/i_module_di.dart';

final class OneOrchestrator extends OrchestratorBase {
  OneOrchestrator(super.coreDi, super.moduleDi);

  @override
  Future<void> init() async {
    interactors.addAll([
      RemoteAuthPart.get(coreDi, moduleDi),
      EnvTypePart.get(coreDi, moduleDi),
      LocalePart.get(coreDi, moduleDi),
      UserPart.get(moduleDi),
      BackendPart.get(coreDi, moduleDi),
    ]);
    moduleDi.get<ThemeEntity>().add(InitTheme());
    loadAllData();
  }

  @override
  Future<void> initData() async {
    moduleDi.get<SettingsEntity>().read();
  }

  @override
  Future<void> loadProtectedData() async {
    if (coreDi.get<RemoteAuthEntity>().state.authVo == null) return;
    moduleDi.get<UserEntity>().read();
    moduleDi.get<ProductsEntity>().add(ReadProducts());
    // moduleDi.get<NotifsRepo>().add(ReadNotifs());
  }

  @override
  Future<void> loadUnprotectedData() async {
    moduleDi.get<RecipesEntity>().add(ReadRecipes());
  }
}
