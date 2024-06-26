import 'package:flutter/material.dart';

import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../core/theme/domain/interface/i_theme.dart';

class SignOutBtnElevated extends StatelessWidget {
  const SignOutBtnElevated({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: context.button.elevated2,
      onPressed: onTap,
      child: Text(L10n.current.signout),
    );
  }
}
