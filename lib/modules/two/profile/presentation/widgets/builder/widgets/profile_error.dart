import 'package:flutter/material.dart';

import '../../../../../../../core/l10n/generated/l10n.dart';
import '../../../../../../../shared/presentation/widgets/signout_button/sign_out_button.dart';
import '../../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../../../../core/di/di.dart';
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
                message ?? L10n.current.somethingWentWrong,
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
                L10n.current.tryAgain,
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
