import 'package:flutter/material.dart';

import '../../../../../../core/l10n/generated/l10n.dart';
import '../../../../../../shared/assets.gen.dart';
import '../../../../../../shared/presentation/widgets/app_bar/app_app_bar.dart';
import '../../../../../../shared/presentation/widgets/app_version_widget.dart';
import '../../../../../../shared/presentation/widgets/divider.dart';

import '../../../../../../shared/presentation/widgets/remote_token_widget.dart';
import '../../../../../../core/router/navigator1_helper.dart';
import '../../../../../../core/theme/domain/interface/i_theme.dart';
import 'widgets/one_logo.dart';
import 'widgets/screen_security_policy.dart';
import 'widgets/screen_user_agreement.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: L10n.current.aboutApp,
      ),
      body: Semantics(
        enabled: true,
        explicitChildNodes: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 20),
            const OneLogo(),
            const SizedBox(height: 14),
            const AppVersionWidget(),
            const SizedBox(height: 32),
            InkWell(
              onTap: () {
                context.router.use.push(
                  const UserAgreementScreen(),
                );
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      L10n.current.userAgreement,
                      style: context.text.s16w500,
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
                      L10n.current.securityPolicy,
                      style: context.text.s16w500,
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
    );
  }
}
