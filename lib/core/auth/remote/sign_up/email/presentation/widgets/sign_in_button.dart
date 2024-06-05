import 'package:flutter/material.dart';

import '../../../../../../l10n/generated/l10n.dart';
import '../../../../../../router/navigator1_helper.dart';
import '../../../../../../theme/domain/interface/i_theme.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${L10n.current.haveAccount}?',
          style: context.text.s16w400,
        ),
        TextButton(
          style: context.button.text1,
          onPressed: () {
            context.router.pop();
          },
          child: Text(L10n.current.signin),
        ),
      ],
    );
  }
}
