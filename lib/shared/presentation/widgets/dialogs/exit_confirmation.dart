import 'package:flutter/material.dart';

import '../../../../core/l10n/generated/l10n.dart';
import '../../../utils/app_global_keys.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import '../../../assets.gen.dart';
import 'app_dialog_extra.dart';

Future<bool?> showExitConfirmation({
  void Function()? onConfirm,
  void Function()? onCancel,
}) {
  final context = AppGlobalKeys.navigator.currentContext!;
  return showAppDialogExtra(
    context,
    icon: CircleAvatar(
      backgroundColor: context.color.errorBg,
      radius: 20,
      child: Assets.shared.icons.signout.svg(),
    ),
    title: L10n.current.appExitConfirmation,
    actionsBuilder: (context) {
      return [
        DialogButton(
          label: L10n.current.cancel,
          onPressed: () {
            Navigator.of(context).pop(true);
            onCancel?.call();
          },
        ),
        DialogButton(
          label: L10n.current.signout,
          style: context.button.text1,
          onPressed: () {
            Navigator.of(context).pop(false);
            onConfirm?.call();
          },
        ),
      ];
    },
  );
}
