import 'package:flutter/material.dart';

import '../../../../../../_shared/assets.gen.dart';
import '../../../../../../_shared/widgets/app_bar/app_app_bar.dart';
import '../../../../../../_shared/widgets/app_version_widget.dart';
import '../../../../../../_shared/widgets/divider.dart';

import '../../../../../../_shared/widgets/remote_token_widget.dart';
import '../../../../../../core/l10n/l10n_helper.dart';
import '../../../../../../core/navigation/navigator1_helper.dart';
import '../../../../../../core/theme/domain/interface/i_theme.dart';
import 'widgets/screen_security_policy.dart';
import 'widgets/screen_user_agreement.dart';
import 'widgets/two_logo.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: context.s.aboutApp,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const TwoLogo(),
            const SizedBox(height: 14),
            const AppVersionWidget(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 16, bottom: 20),
                children: [
                  InkWell(
                    onTap: () {
                      context.rootRouter.use.push(
                        const UserAgreementScreen(),
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            context.s.userAgreement,
                            style: context.text.s16w400,
                          ),
                        ),
                        Assets.shared.icons.chevronRight.svg(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const AppDivider(),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      context.router.use.push(
                        const SecurityPolicyScreen(),
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            context.s.securityPolicy,
                            style: context.text.s16w400,
                          ),
                        ),
                        Assets.shared.icons.chevronRight.svg(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const AppDivider(),
                  const SizedBox(height: 16),
                  const RemoteTokenWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
