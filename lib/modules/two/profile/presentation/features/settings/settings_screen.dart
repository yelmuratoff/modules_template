import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../_shared/assets.gen.dart';
import '../../../../../../_shared/widgets/app_bar/app_app_bar.dart';
import '../../../../../../_shared/widgets/dialogs/app_dialog_extra.dart';
import '../../../../../../_shared/widgets/divider.dart';

import '../../../../../../_shared/widgets/settings_local_auth_widget.dart';
import '../../../../../../_shared/widgets/settings_tile.dart';
import '../../../../../../core/l10n/l10n_helper.dart';
import '../../../../../../core/navigation/navigator1_helper.dart';
import '../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../../../di.dart';
import '../../../../../_shared/features/settings/change_email/presentation/change_email_screen.dart';
import '../../../../../_shared/features/settings/change_password/presentation/change_password_screen.dart';
import '../../../../../_shared/features/settings/change_phone/presentation/change_phone_screen.dart';
import '../../../domain/entity/user_entity.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserEntity, UserState>(
      bloc: appDi.current.get<UserEntity>(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppAppBar(
            title: context.s.settings,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Text(
                  context.s.profile,
                  style: context.text.s12w700.copyWith(
                    color: context.color.accent,
                  ),
                ),
                SettingsTile.chevron(
                  title: context.s.changeEmail,
                  subtitle: state.currentUser?.email,
                  onPressed: () {
                    context.router.use.push(
                      ChangeEmailScreen(
                        onSuccess: () {
                          appDi.current.get<UserEntity>().read();
                        },
                      ),
                    );
                  },
                ),
                const AppDivider(),
                SettingsTile.chevron(
                  title: context.s.changePhoneNumber,
                  subtitle: state.currentUser?.phone,
                  onPressed: () {
                    context.router.use.push(
                      const ChangePhoneScreen(),
                    );
                  },
                ),
                const AppDivider(),
                SettingsTile.chevron(
                  title: context.s.changePassword,
                  onPressed: () {
                    context.router.use.push(
                      const ChangePasswordScreen(),
                    );
                  },
                ),
                const AppDivider(),
                SettingsTile(
                  title: context.s.removeAccount,
                  onPressed: () {
                    showAppDialogExtra(
                      context,
                      icon: Assets.shared.icons.trashOutlined.svg(),
                      title: context.s.accountDeletetionConfirmationTitle,
                      actionsBuilder: (context) {
                        return [
                          DialogButton(
                            label: context.s.cancel,
                            onPressed: Navigator.of(context).pop,
                          ),
                          DialogButton(
                            label: context.s.delete,
                            style: context.button.text1,
                            onPressed: () {
                              Navigator.of(context).pop();
                              context.read<UserEntity>().delete();
                            },
                          ),
                        ];
                      },
                    );
                  },
                ),
                const AppDivider(),
                const SizedBox(height: 32),
                const SettingsLocalAuthWidget(),
                const SizedBox(height: 32),
                Text(
                  context.s.notifs,
                  style: context.text.s12w700.copyWith(
                    color: context.color.accent,
                  ),
                ),
                const AppDivider(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
