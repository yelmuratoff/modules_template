import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/l10n/generated/l10n.dart';
import '../../../../../../shared/assets.gen.dart';
import '../../../../../../shared/presentation/widgets/app_bar/app_app_bar.dart';
import '../../../../../../shared/presentation/widgets/dialogs/app_dialog_extra.dart';
import '../../../../../../shared/presentation/widgets/divider.dart';
import '../../../../../../shared/presentation/widgets/settings_local_auth_widget.dart';
import '../../../../../../shared/presentation/widgets/settings_tile.dart';
import '../../../../../../core/auth/local/domain/entity/local_auth_entity.dart';
import '../../../../../../core/router/navigator1_helper.dart';
import '../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../../../core/di/di.dart';
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
                title: L10n.current.settings,
              ),
              body: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 16, top: 16),
                children: [
                  Text(
                    L10n.current.personData,
                    style: context.text.s12w700.copyWith(
                      color: context.color.accent,
                    ),
                  ),
                  SettingsTile.chevron(
                    title: L10n.current.changeEmail,
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
                    title: L10n.current.changePhoneNumber,
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
                    title: L10n.current.changePassword,
                    onPressed: () {
                      context.router.use.push(
                        const ChangePasswordScreen(),
                      );
                    },
                  ),
                  const AppDivider(),
                  SettingsTile(
                    title: L10n.current.accountDelete,
                    onPressed: () {
                      showAppDialogExtra(
                        context,
                        icon: Assets.shared.icons.trashOutlined.svg(),
                        title: L10n.current.accountDeletetionConfirmationTitle,
                        body: L10n.current.accountDeletetionConfirmationBody,
                        actionsBuilder: (context) {
                          return [
                            DialogButton(
                              label: L10n.current.cancel,
                              onPressed: Navigator.of(context).pop,
                            ),
                            DialogButton(
                              label: L10n.current.delete,
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
                ],
              ),
            );
          },
        );
      },
    );
  }
}
