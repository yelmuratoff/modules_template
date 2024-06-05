import 'package:loader_overlay/loader_overlay.dart';

import '../../../../core/_shared/app_global_keys.dart';
import '../../../../core/auth/combined/presentation/core_auth.dart';
import '../two_auth.dart';

abstract final class TwoAuthVerify {
  static Future<bool> verify({
    bool checkRemoteAuth = true,
    bool checkLocalAuth = true,
  }) async {
    var authorized = true;
    //core auth
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
    if (authorized) TwoAuth.onSuccess();
    return authorized;
  }
}
