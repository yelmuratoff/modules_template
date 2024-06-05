import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../di/di.dart';
import '../../../../shared/utils/app_global_keys.dart';
import '../../../router/navigator1_helper.dart';
import '../../local/domain/value_objects/local_auth_dto.dart';
import '../../local/presentation/ui/app_local_auth.dart';
import '../../remote/sign_in/main/presentation/sign_in_screen.dart';
import '../domain/entity/auth_entity.dart';

part 'parts/set_action.dart';

abstract class CoreAuth {
  static AsyncCallback? _action;

  static AsyncCallback? get onSuccess => _action;

  static Future<bool> verify({
    AsyncCallback? onSuccess,
    bool local = true,
    bool remote = true,
  }) async {
    await _setAction(onSuccess, localAuthSetup: true);

    final result = await appDi.core.get<AuthEntity>().authState();

    if (remote) {
      if (!result.remote) {
        AppGlobalKeys.navigator.currentState.use?.push(
          const SignInScreen(),
        );
        return false;
      }
    }

    if (local) {
      var isLocallyAuthorized = result.local;
      if (!result.local) {
        isLocallyAuthorized = await AppLocalAuth.verification(
          LocalAuthDto(
            modes: const {
              LocalAuthMode.pin,
              LocalAuthMode.biometrics,
            },
            canPop: true,
          ),
        );
      }
      if (!isLocallyAuthorized) {
        return false;
      }
    }

    return true;
  }

  static void signIn({AsyncCallback? onSuccess}) {
    _setAction(onSuccess);
    AppGlobalKeys.navigator.currentState.use?.push(
      const SignInScreen(),
    );
  }
}
