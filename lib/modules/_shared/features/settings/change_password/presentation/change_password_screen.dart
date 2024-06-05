import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../../shared/presentation/widgets/app_bar/app_app_bar.dart';
import '../../../../../../shared/presentation/widgets/app_unfocuser.dart';
import '../../../../../../shared/presentation/widgets/banners/show_banner.dart';
import '../../../../../../shared/presentation/widgets/text_fields/password_text_field.dart';
import '../../../../../../shared/exceptions/app_exception.dart';
import '../../../../../../shared/utils/extensions/object_to_error.dart';
import '../../../../../../core/auth/remote/recovery/request_recovery/main/auth_recovery_screen.dart';
import '../../../../../../core/api/backend/domain/entity/core_backend.dart';
import '../../../../../../core/l10n/generated/l10n.dart';
import '../../../../../../core/router/navigator1_helper.dart';
import '../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../../../core/di/di.dart';
import '../data/pass_change_repo.dart';
import '../domain/entity/pass_change_entity.dart';

part 'widgets/fields.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final fields = _Fields();

  @override
  void dispose() {
    fields.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PassChangeEntity>(
      create: (context) {
        return PassChangeEntity(
          remote: PassChangeRepo(
            gateway: appDi.core.get<CoreBackend>().gateway,
          ),
        );
      },
      child: AppUnfocuser(
        child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppAppBar(
                title: L10n.current.changePassword,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Text(
                          L10n.current.currentPassword,
                          style: context.text.s14w400.copyWith(
                            color: context.color.grey900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        fields.currentPasswordField,
                        const SizedBox(height: 16),
                        Text(
                          L10n.current.newPassword,
                          style: context.text.s14w400.copyWith(
                            color: context.color.grey900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        fields.newPasswordField,
                        const SizedBox(height: 16),
                        Text(
                          L10n.current.confPassword,
                          style: context.text.s14w400.copyWith(
                            color: context.color.grey900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        fields.confPasswordField,
                        const SizedBox(height: 24),
                        Center(
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              context.router.use.push(
                                const AuthRecoveryScreen(),
                              );
                            },
                            child: Text(
                              '${L10n.current.forgotPassword} ?',
                              style: context.text.s16w400.copyWith(
                                color: context.color.accent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<PassChangeEntity, ChangeState>(
                    listener: (context, state) {
                      if (state is ChangeLoading) {
                        ShowBanner.hide();
                        context.loaderOverlay.show();
                      } else {
                        context.loaderOverlay.hide();
                      }
                      if (state is ChangeError) {
                        if (state.error is AuthException) {
                          final newPassErrors =
                              (state.error as AuthException).password;
                          if (newPassErrors != null) {
                            fields.newPasswordField.data
                                .showErrors(newPassErrors);
                          }
                          final cPassErrors =
                              (state.error as AuthException).cPassword;
                          if (cPassErrors != null) {
                            fields.currentPasswordField.data
                                .showErrors(cPassErrors);
                          }
                          if (newPassErrors == null && cPassErrors == null) {
                            ShowBanner.error(
                              message: state.error.toErrorMessage(),
                              seconds: 3,
                            );
                          }
                        } else {
                          ShowBanner.error(
                            message: state.error.toErrorMessage(),
                            seconds: 3,
                          );
                        }
                      }
                      if (state is ChangeSuccess) {
                        Navigator.of(context).pop();
                        ShowBanner.success(
                          message: L10n.current.passwordSaved,
                          seconds: 3,
                        );
                      }
                    },
                    builder: (context, state) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        child: ElevatedButton(
                          style: context.button.elevated1,
                          onPressed: () {
                            FocusScope.of(context).unfocus();

                            if (fields.isValidated) {
                              BlocProvider.of<PassChangeEntity>(context).add(
                                DoChange(
                                  currentPassword: fields.currentPasswordField
                                      .data.controller.text,
                                  newPassword: fields
                                      .newPasswordField.data.controller.text,
                                ),
                              );
                            }
                          },
                          child: Text(L10n.current.save),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
