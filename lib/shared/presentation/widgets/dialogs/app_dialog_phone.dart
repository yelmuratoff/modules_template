import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/l10n/generated/l10n.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import '../../../utils/extensions/string.dart';
import '../app_unfocuser.dart';
import '../text_fields/phone_textfield.dart';

Future<void> showAppDialogPhone({
  required BuildContext context,
  required Function(String text) onConfirm,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => _AppDialogPhone(
      onConfirm: onConfirm,
    ),
  );
}

class _AppDialogPhone extends StatefulWidget {
  const _AppDialogPhone({required this.onConfirm});

  final Function(String text) onConfirm;

  @override
  State<_AppDialogPhone> createState() => _AppDialogPhoneState();
}

class _AppDialogPhoneState extends State<_AppDialogPhone> {
  late final phone = PhoneTextfield(
    data: PhoneTextfieldData(autofocus: true),
  );

  @override
  void dispose() {
    phone.data.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: AppUnfocuser(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      L10n.current.phoneNumber,
                      textAlign: TextAlign.center,
                      style: context.text.s14w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                0,
                20,
                20,
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        phone.data.focusNode.requestFocus();
                        phone.data.controller.selection =
                            TextSelection.fromPosition(
                          TextPosition(
                            offset: phone.data.controller.text.length,
                          ),
                        );
                      },
                      onLongPress: () async {
                        final data = await Clipboard.getData(
                          Clipboard.kTextPlain,
                        );
                        final text = data?.text;
                        if (text == null) return;
                        phone.data.controller
                          ..clear()
                          ..text = text.formatAsPhone ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: phone.data.controller.text.length,
                            ),
                          );
                      },
                      child: IgnorePointer(
                        child: phone,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 8,
                      ),
                      child: ElevatedButton(
                        style: context.button.elevated2,
                        child: Text(
                          L10n.current.cancel,
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 16,
                      ),
                      child: ElevatedButton(
                        style: context.button.elevated1,
                        child: Text(
                          L10n.current.okay,
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          if (phone.data.validate) {
                            Navigator.of(context).pop();
                            widget.onConfirm(phone.data.controller.text);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
