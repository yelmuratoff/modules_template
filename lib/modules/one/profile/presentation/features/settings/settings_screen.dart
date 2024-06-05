import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../_shared/assets.gen.dart';
import '../../../../../../_shared/widgets/app_bar/app_app_bar.dart';
import '../../../../../../_shared/widgets/dialogs/app_dialog_extra.dart';
import '../../../../../../_shared/widgets/divider.dart';
import '../../../../../../_shared/widgets/settings_local_auth_widget.dart';
import '../../../../../../_shared/widgets/settings_tile.dart';
import '../../../../../../core/auth/local/domain/entity/local_auth_entity.dart';
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
        return BlocBuilder<LocalAuthEntity, LocalAuthState>(
          bloc: appDi.core.get<LocalAuthEntity>(),
          builder: (context, localState) {
            return Scaffold(
              appBar: AppAppBar(
                title: context.s.settings,
              ),
              body: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 16, top: 16),
                children: [
                  Text(
                    context.s.personData,
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
                        ChangePhoneScreen(
                          onSuccess: () {
                            appDi.current.get<UserEntity>().read();
                          },
                        ),
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
                    title: context.s.accountDelete,
                    onPressed: () {
                      showAppDialogExtra(
                        context,
                        icon: Assets.shared.icons.trashOutlined.svg(),
                        title: context.s.accountDeletetionConfirmationTitle,
                        body: context.s.accountDeletetionConfirmationBody,
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
                                appDi.current.get<UserEntity>().delete();
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
                    context.s.notifications,
                    style: context.text.s12w700.copyWith(
                      color: context.color.accent,
                    ),
                  ),
                  const AppDivider(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
