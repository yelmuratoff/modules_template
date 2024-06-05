import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/domain/interface/i_theme.dart';

class AppBanner extends MaterialBanner {
  AppBanner({
    required ThemeData theme,
    super.key,
    String? message,
    Widget? content,
    VoidCallback? onCancel,
    bool showCloseButton = true,
    VoidCallback? onVisible,
    int? seconds,
    super.leading,
    super.backgroundColor,
    List<Widget>? actions,
  }) : super(
          padding: const EdgeInsets.fromLTRB(18, 4, 0, 4),
          elevation: 2,
          content: content ??
              Row(
                children: [
                  Expanded(
                    child: Text(
                      message ?? '',
                      style: theme.text.s14w400.copyWith(
                        height: 1.6,
                        color: theme.color.background,
                      ),
                    ),
                  ),
                ],
              ),
          actions: [
            Builder(
              builder: (context) {
                if (showCloseButton == true) {
                  return IconButton(
                    icon: const Icon(Icons.close),
                    color: context.color.background,
                    onPressed: onCancel,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            ...?actions,
          ],
          onVisible: () {
            if (seconds != null) {
              Timer(
                Duration(seconds: seconds),
                () {
                  onCancel?.call();
                },
              );
            }
            onVisible?.call();
          },
        );
}
