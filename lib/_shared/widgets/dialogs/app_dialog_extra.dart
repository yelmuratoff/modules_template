import 'package:flutter/material.dart';

import '../../../core/theme/domain/interface/i_theme.dart';
import 'app_dialog_extra_custom.dart';

export 'buttons/dialog_button.dart';

Future<T?> showAppDialogExtra<T>(
  BuildContext context, {
  String? title,
  String? body,
  Widget? icon = const Icon(
    Icons.info,
    size: 48,
  ),
  bool barrierDismissible = true,
  List<Widget> Function(BuildContext)? actionsBuilder,
}) {
  Widget? titleWidget;
  if (title != null) {
    titleWidget = Text(
      title,
      style: context.text.hs16w700,
    );
  }
  Widget? bodyWidget;
  if (body != null) {
    bodyWidget = Text(
      body,
      style: context.text.s14w400.copyWith(
        color: context.color.grey900,
      ),
    );
  }
  return showAppDialogExtraCustom(
    context,
    icon: icon,
    title: titleWidget,
    body: bodyWidget,
    barrierDismissible: barrierDismissible,
    actionsBuilder: actionsBuilder,
  );
}
