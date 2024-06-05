import 'package:flutter/material.dart';

import '../../../../../../shared/presentation/widgets/app_bar/app_app_bar.dart';
import '../../../../../../shared/presentation/widgets/app_tab_bar/app_tab.dart';
import '../../../../../../shared/presentation/widgets/app_tab_bar/app_tab_bar.dart';
import '../../../../../../shared/presentation/widgets/app_unfocuser.dart';
import '../../../../../../shared/presentation/widgets/utils/get_logo_path.dart';
import '../../../../../di/di.dart';
import '../../../../../di/module/switcher/domain/entity/module_entity.dart';
import '../../../../../l10n/generated/l10n.dart';
import '../../../../../theme/domain/interface/i_theme.dart';
import '../../email/presentation/email_tab.dart';
import '../../phone/presentation/phone_tab.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        appBar: AppAppBar(
          title: L10n.current.createAccount,
        ),
        body: DefaultTabController(
          length: 2,
          child: Builder(
            builder: (context) {
              final controller = DefaultTabController.of(context);
              controller.addListener(() {
                if (!controller.indexIsChanging) {
                  FocusScope.of(context).unfocus();
                }
              });
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
                  AppTabBar(
                    theme: context.theme,
                    tabs: [
                      AppTab(text: L10n.current.withEmail),
                      AppTab(text: L10n.current.withPhone),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        EmailTab(),
                        PhoneTab(),
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
