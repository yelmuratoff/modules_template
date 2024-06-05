import 'package:flutter/material.dart';

import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../core/theme/domain/interface/i_theme.dart';
import '../../loader_overlay/app_progress_indicator.dart';

class SmsVerificationWaiting extends StatelessWidget {
  const SmsVerificationWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: AppProgressIndicator(),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                L10n.current.smsCodeTooManyAttemts,
                style: context.text.s14w400.copyWith(
                  color: context.color.error,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
