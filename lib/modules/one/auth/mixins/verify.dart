import 'package:loader_overlay/loader_overlay.dart';

import '../../../../core/_shared/app_global_keys.dart';
import '../../../../core/auth/combined/presentation/core_auth.dart';
import '../one_auth.dart';

abstract final class OneAuthVerify {
  static Future<bool> verify({
    bool checkLocalAuth = true,
    bool checkRemoteAuth = true,
  }) async {
    var authorized = true;

    if (checkRemoteAuth || checkLocalAuth) {
      AppGlobalKeys.scaffoldMessenger.currentContext?.loaderOverlay.show();
      final isVerified = await CoreAuth.verify(
        local: checkLocalAuth,
        remote: checkRemoteAuth,
        onSuccess: () async {
          verify(
            checkLocalAuth: false,
            checkRemoteAuth: false,
          );
        },
      );
      if (!isVerified) {
        AppGlobalKeys.scaffoldMessenger.currentContext?.loaderOverlay.hide();
        authorized = false;
      }
    }

    AppGlobalKeys.scaffoldMessenger.currentContext?.loaderOverlay.hide();
    if (authorized) OneAuth.onSuccess();

    return authorized;
  }
}
