import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_helper.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import '../../../assets.gen.dart';

class CancelLeadingButton extends StatelessWidget {
  const CancelLeadingButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: context.s.close,
      child: IconButton(
        icon: Assets.shared.icons.cancel.svg(),
        color: context.color.textPrimary,
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (onPressed == null) {
            Navigator.maybePop(context);
          } else {
            onPressed?.call();
          }
        },
      ),
    );
  }
}
