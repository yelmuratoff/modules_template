import 'package:flutter/material.dart';

import '../../../../../../_shared/widgets/app_bar/app_app_bar.dart';
import '../../../../../../_shared/widgets/app_bar/leading_buttons/cancel_leading_button.dart';
import '../../../../../../_shared/widgets/app_unfocuser.dart';
import '../../../../../../_shared/widgets/utils/get_logo_path.dart';
import '../../../../../../di.dart';
import '../../../../../di/module/switcher/domain/entity/module_entity.dart';
import '../../../../../l10n/l10n_helper.dart';
import '../../../../../navigation/navigator1_helper.dart';
import '../../../../../theme/domain/interface/i_theme.dart';
import '../../../sign_up/main/presentation/sign_up_screen.dart';
import '../../email/presentation/email_tab.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.color.background,
      child: AppUnfocuser(
        child: Scaffold(
          appBar: AppAppBar(
            leading: const CancelLeadingButton(),
            actions: [
              TextButton(
                style: context.button.text1,
                child: Text(
                  context.s.signup,
                ),
                onPressed: () {
                  context.router.use.push(
                    const SignUpScreen(),
                  );
                },
              ),
            ],
          ),
          body: Builder(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Image.asset(
                      appDi.core.get<ModuleEntity>().state.module.logoPath,
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                  ),
                  const Expanded(child: EmailTab()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
