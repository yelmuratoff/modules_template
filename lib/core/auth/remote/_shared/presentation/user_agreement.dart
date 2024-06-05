import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../_shared/widgets/app_checkbox.dart';
import '../../../../../_shared/widgets/dialogs/user_agreement.dart';
import '../../../../l10n/l10n_helper.dart';
import '../../../../theme/domain/interface/i_theme.dart';

class UserAgreement extends StatelessWidget {
  UserAgreement({super.key});

  final isValidated = ValueNotifier(false);

  void dispose() {
    isValidated.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isValidated,
      builder: (context, value, _) {
        return Row(
          children: [
            AppCheckbox(
              initial: isValidated.value,
              onChanged: (value) {
                FocusScope.of(context).unfocus();
                if (value == null) return;
                isValidated.value = value;
              },
            ),
            const SizedBox(width: 6),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: context.s.userLicenseAgree1,
                  style: context.text.s14w400.copyWith(height: 1.33),
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: context.s.userLicenseAgree2.toLowerCase(),
                      style: context.text.s14w400.copyWith(
                        color: context.color.link,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          FocusScope.of(context).unfocus();
                          showUserAgreement(context);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
