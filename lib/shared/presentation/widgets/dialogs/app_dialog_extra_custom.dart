import 'package:flutter/material.dart';

import '../../../../core/l10n/generated/l10n.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import 'buttons/dialog_button.dart';

export 'buttons/dialog_button.dart';

Future<T?> showAppDialogExtraCustom<T>(
  BuildContext context, {
  Widget? title,
  Widget? body,
  Widget? icon = const Icon(
    Icons.info,
    size: 48,
  ),
  bool barrierDismissible = true,
  List<Widget> Function(BuildContext)? actionsBuilder,
}) {
  return showDialog<T?>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) {
      return PopScope(
        canPop: barrierDismissible,
        child: Dialog(
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          if (icon != null)
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: icon,
                              ),
                            ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (title != null)
                                  Row(
                                    children: [
                                      Expanded(child: title),
                                    ],
                                  ),
                                if ((title != null) && body != null)
                                  const SizedBox(height: 16),
                                if (body != null)
                                  Row(
                                    children: [
                                      Expanded(child: body),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (actionsBuilder != null)
                        ...actionsBuilder(context)
                      else ...[
                        DialogButton(
                          label: L10n.current.cancel,
                          onPressed: Navigator.of(context).pop,
                        ),
                        DialogButton(
                          style: context.button.text1,
                          label: L10n.current.next,
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
