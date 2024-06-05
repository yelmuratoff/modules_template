import 'dart:async';

import 'package:flutter/material.dart';

import '../../../utils/app_global_keys.dart';
import '../../../../core/di/module/switcher/domain/value_objects/app_module.dart';
import '../../../../core/l10n/generated/l10n.dart';
import '../../../../core/theme/domain/entity/theme_entity.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../core/di/di.dart';
import '../../../assets.gen.dart';
import '../utils/get_logo_path.dart';
import 'app_banner.dart';

class ShowBanner {
  static void hide() {
    AppGlobalKeys.scaffoldMessenger.currentState?.hideCurrentMaterialBanner();
  }

  static void error({
    String? message,
    Widget? child,
    bool showCloseButton = true,
    int? seconds,
    VoidCallback? onVisible,
  }) {
    final theme = appDi.current.get<ThemeEntity>().state.data;
    final messenger = AppGlobalKeys.scaffoldMessenger.currentState;
    messenger?.hideCurrentMaterialBanner();
    messenger?.showMaterialBanner(
      AppBanner(
        message: message,
        content: child,
        theme: theme,
        backgroundColor: theme.color.error,
        leading: Assets.shared.icons.infoHex.svg(),
        showCloseButton: showCloseButton,
        seconds: seconds,
        onVisible: onVisible,
        onCancel: messenger.hideCurrentMaterialBanner,
      ),
    );
  }

  static void success({
    String? message,
    Widget? child,
    bool showCloseButton = true,
    int? seconds,
    VoidCallback? onVisible,
  }) {
    final theme = appDi.current.get<ThemeEntity>().state.data;
    final messenger = AppGlobalKeys.scaffoldMessenger.currentState;
    messenger?.hideCurrentMaterialBanner();
    messenger?.showMaterialBanner(
      AppBanner(
        message: message,
        content: child,
        theme: theme,
        backgroundColor: theme.color.success,
        leading: Assets.shared.icons.checkOutlined.svg(),
        showCloseButton: showCloseButton,
        seconds: seconds,
        onVisible: onVisible,
        onCancel: messenger.hideCurrentMaterialBanner,
      ),
    );
  }

  static void pushNotification({
    required AppModule module,
    String? title,
    String? body,
    int? seconds,
    VoidCallback? onTap,
    String? bottomMessage,
  }) {
    final theme = appDi.current.get<ThemeEntity>().state.data;
    final color = theme.color;
    final text = theme.text;
    final messenger = AppGlobalKeys.scaffoldMessenger.currentState;
    messenger?.hideCurrentMaterialBanner();

    void onVisible() {
      if (seconds != null) {
        Timer(
          Duration(seconds: seconds),
          () {
            messenger?.hideCurrentMaterialBanner();
          },
        );
      }
    }

    messenger?.showMaterialBanner(
      AppBanner(
        content: GestureDetector(
          child: AbsorbPointer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        module.iconPath,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? L10n.current.notification,
                            style: text.s16w700.copyWith(
                              fontSize: 13,
                              color: color.background,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            body ?? L10n.current.youGetNewNotification,
                            style: text.s16w600.copyWith(
                              fontSize: 13,
                              color: color.background,
                            ),
                          ),
                          if (bottomMessage != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                bottomMessage,
                                style: text.s14w400.copyWith(
                                  color: color.background,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          onTap: () {
            messenger.hideCurrentMaterialBanner();
            onTap?.call();
          },
        ),
        theme: theme,
        backgroundColor: Colors.black.withOpacity(0.65),
        seconds: seconds,
        onVisible: onVisible,
        onCancel: messenger.hideCurrentMaterialBanner,
      ),
    );
  }
}
