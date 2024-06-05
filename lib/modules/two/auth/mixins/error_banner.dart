import 'package:flutter/material.dart';

import '../../../../_shared/assets.gen.dart';
import '../../../../_shared/widgets/banners/app_banner.dart';
import '../../../../_shared/widgets/dialogs/exit_confirmation.dart';
import '../../../../core/_shared/app_global_keys.dart';
import '../../../../core/l10n/generated/l10n.dart';
import '../../../../core/navigation/navigator1_helper.dart';
import '../../../../core/theme/domain/entity/theme_entity.dart';
import '../../../../core/theme/domain/interface/i_button_styles.dart';
import '../../../../core/theme/domain/interface/i_colors.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../di.dart';

abstract final class TwoAuthBanner {
  ///Can be useful in case of a failure
  ///of some additional checks
  ///you might need to implement
  void showErrorBanner({
    required String message,
    int? seconds,
  }) {
    AppGlobalKeys.scaffoldMessenger.currentState?.hideCurrentMaterialBanner();
    final theme = appDi.current.get<ThemeEntity>().state.data;
    AppGlobalKeys.scaffoldMessenger.currentState?.showMaterialBanner(
      AppBanner(
        content: Row(
          children: [
            Expanded(
              child: Text(
                message,
                style: theme.text.s14w400.copyWith(
                  height: 1.6,
                  color: theme.color.background,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              color: theme.extension<IColors>()!.background,
              onPressed: () {
                AppGlobalKeys.scaffoldMessenger.currentState
                    ?.hideCurrentMaterialBanner();
              },
            ),
          ],
        ),
        theme: theme,
        backgroundColor: theme.extension<IColors>()!.error,
        leading: Assets.shared.icons.infoHex.svg(),
        showCloseButton: false,
        seconds: seconds,
        actions: [
          TextButton(
            style: theme.extension<IButtonStyles>()!.text3,
            onPressed: () {
              AppGlobalKeys.scaffoldMessenger.currentState
                  ?.hideCurrentMaterialBanner();
              showExitConfirmation(
                onConfirm: () {
                  AppGlobalKeys.navigator.currentState?.use.pushSignOutScreen();
                },
              );
            },
            child: Text(S.current.signout),
          ),
        ],
      ),
    );
  }
}
