import 'package:flutter/material.dart';

import '../../../../../../l10n/l10n_helper.dart';
import '../../../../../../navigation/navigator1_helper.dart';
import '../../../../../../theme/domain/interface/i_theme.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${context.s.haveAccount}?',
          style: context.text.s16w400,
        ),
        TextButton(
          style: context.button.text1,
          onPressed: () {
            context.router.pop();
          },
          child: Text(context.s.signin),
        ),
      ],
    );
  }
}
