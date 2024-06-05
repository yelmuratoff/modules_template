import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../di/di.dart';
import '../../../../../../shared/exceptions/app_exception.dart';
import '../../../../../../shared/utils/extensions/object_to_error.dart';
import '../../../../../../shared/presentation/widgets/banners/show_banner.dart';
import '../../../../../../shared/presentation/widgets/text_fields/email_textfield.dart';
import '../../../../../../shared/presentation/widgets/text_fields/password_text_field.dart';
import '../../../../../api/backend/domain/entity/core_backend.dart';
import '../../../../../l10n/generated/l10n.dart';
import '../../../../../router/navigator1_helper.dart';
import '../../../../../theme/domain/interface/i_theme.dart';
import '../../../../combined/presentation/core_auth.dart';
import '../../../_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../recovery/request_recovery/main/auth_recovery_screen.dart';
import '../../_shared/presentation/widgets/sign_in_button.dart';
import '../data/email_sign_in_repo.dart';
import '../domain/entity/email_sign_in_entity.dart';

class EmailTab extends StatefulWidget {
  const EmailTab({super.key});

  @override
  State<EmailTab> createState() => _EmailTabState();
}

class _EmailTabState extends State<EmailTab> {
  late final EmailTextfield email = EmailTextfield(
    data: EmailTextfieldData(
      initial: 'emilys@posterous.com',
      validateOnInit: true,
      nextFocus: password.data.focusNode,
    ),
  );

  final entity = EmailSignInEntity(
    remote: EmailSignInRepo(
      gateway: appDi.core.get<CoreBackend>().gateway,
    ),
  );

  late final PasswordTextField password = PasswordTextField(
    data: PasswordTextfieldData(
      initial: 'emilyspass',
      validateOnInit: true,
      onSubmit: (value) {
        final emailData = email.data;
        final passwordData = password.data;
        emailData.clearErrors;
        passwordData.clearErrors;

        if (emailData.validate && passwordData.validate) {
          entity.add(
            DoSignIn(
              email: emailData.controller.text,
              password: passwordData.controller.text,
            ),
          );
        }
      },
    ),
  );

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    entity.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailSignInEntity, SignInState>(
      bloc: entity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            email,
            const SizedBox(height: 14),
            password,
            const SizedBox(height: 14),
            TextButton(
              style: context.button.text1,
              child: Text('${L10n.current.forgotPassword}?'),
              onPressed: () {
                context.router.use.push(
                  const AuthRecoveryScreen(),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
              child: SignInButton(
                listenables: [
                  email.data.isValidated,
                  password.data.isValidated,
                ],
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                  FocusScope.of(context).unfocus();
                  email.data.clearErrors;
                  password.data.clearErrors;
                  entity.add(
                    DoSignIn(
                      email: email.data.controller.text,
                      password: password.data.controller.text,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      listener: (context, state) async {
        if (state is SignInLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
        if (state is SignInError) {
          ShowBanner.hide();
          switch (state.error) {
            case final AuthException error:
              if (error.message != null) {
                ShowBanner.error(message: error.message);
              }
              if (error.email != null) {
                email.data.showErrors(error.email);
              }
              if (error.password != null) {
                password.data.showErrors(error.password);
              }
              break;
            default:
              ShowBanner.error(
                message: state.error.toErrorMessage(),
              );
              break;
          }
        }
        if (state is SignInSuccess) {
          appDi.core.get<RemoteAuthEntity>().updateAuthVo(
                state.vo,
              );
          CoreAuth.onSuccess?.call();
        }
      },
    );
  }
}
