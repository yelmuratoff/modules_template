import 'package:flutter/material.dart';

import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../assets.gen.dart';

class CancelLeadingButton extends StatelessWidget {
  const CancelLeadingButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: L10n.current.close,
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
