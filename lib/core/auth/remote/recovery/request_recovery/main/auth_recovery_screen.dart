import 'package:flutter/material.dart';

import '../../../../../../_shared/widgets/app_bar/app_app_bar.dart';
import '../../../../../../_shared/widgets/app_tab_bar/app_tab.dart';
import '../../../../../../_shared/widgets/app_tab_bar/app_tab_bar.dart';
import '../../../../../../_shared/widgets/app_unfocuser.dart';
import '../../../../../l10n/l10n_helper.dart';
import '../../../../../theme/domain/interface/i_theme.dart';
import '../email/presentation/email_tab.dart';
import '../phone/presentation/phone_tab.dart';

class AuthRecoveryScreen extends StatelessWidget {
  const AuthRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppAppBar(
          title: context.s.recoverPassword,
        ),
        body: DefaultTabController(
          length: 2,
          child: Builder(
            builder: (context) {
              final controller = DefaultTabController.of(context);
              controller.addListener(() {
                if (controller.previousIndex != controller.index) {
                  FocusScope.of(context).unfocus();
                }
              });
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTabBar(
                    theme: context.theme,
                    padding: const EdgeInsets.only(left: 20),
                    tabs: [
                      AppTab(text: context.s.withEmail),
                      AppTab(text: context.s.withPhone),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: EmailTab(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: PhoneTab(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
