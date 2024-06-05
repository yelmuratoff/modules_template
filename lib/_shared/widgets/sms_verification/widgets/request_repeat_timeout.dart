import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_helper.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import '../../timeout_switcher.dart';

class RequestRepeatTimeout extends StatelessWidget {
  const RequestRepeatTimeout({
    required this.onTap,
    required this.canPop,
    super.key,
    this.timeout,
  });

  final bool canPop;
  final VoidCallback onTap;
  final DateTime? timeout;

  @override
  Widget build(BuildContext context) {
    return TimeoutSwitcher(
      timeout: timeout,
      before: (remaining) => Center(
        key: const ValueKey(11),
        child: TextButton(
          key: const ValueKey(12),
          style: TextButton.styleFrom(
            textStyle: context.text.s16w400.copyWith(
              color: context.color.grey900,
            ),
          ),
          onPressed: null,
          child: Text(
            context.s.smsCodeRequestTimeout(remaining),
            style: context.text.s16w400.copyWith(
              color: context.color.grey900,
            ),
          ),
        ),
      ),
      after: Center(
        key: const ValueKey(21),
        child: TextButton(
          key: const ValueKey(22),
          style: context.button.text1,
          onPressed: () {
            onTap();
            if (canPop) Navigator.of(context).pop();
          },
          child: Text(
            context.s.smsCodeRequest,
          ),
        ),
      ),
    );
  }
}
