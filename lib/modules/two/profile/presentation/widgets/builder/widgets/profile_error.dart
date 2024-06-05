import 'package:flutter/material.dart';

import '../../../../../../../_shared/widgets/signout_button/sign_out_button.dart.dart';
import '../../../../../../../core/l10n/l10n_helper.dart';
import '../../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../../../../di.dart';
import '../../../../domain/entity/user_entity.dart';

class ProfileError extends StatelessWidget {
  const ProfileError({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                message ?? context.s.somethingWentWrong,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: context.button.elevated1,
              onPressed: () {
                appDi.current.get<UserEntity>().read();
              },
              child: Text(
                context.s.tryAgain,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const SignOutButton.elevated(),
      ],
    );
  }
}
