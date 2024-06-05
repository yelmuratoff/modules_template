import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_helper.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import '../../../assets.gen.dart';

class ArrowLeadingButton extends StatelessWidget {
  const ArrowLeadingButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Semantics(
        label: context.s.comeBack,
        child: Assets.shared.icons.chevronLeft.svg(),
      ),
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
    );
  }
}
