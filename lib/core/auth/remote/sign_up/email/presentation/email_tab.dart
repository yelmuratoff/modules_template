import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../../_shared/widgets/banners/show_banner.dart';
import '../../../../../../_shared/widgets/text_fields/email_textfield.dart';
import '../../../../../../_shared/widgets/text_fields/password_text_field.dart';
import '../../../../../../di.dart';
import '../../../../../_shared/exceptions/app_exception.dart';
import '../../../../../_shared/utils/extensions/object_to_error.dart';
import '../../../../../network/backend/domain/entity/core_backend.dart';
import '../../../../combined/presentation/core_auth.dart';
import '../../../_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../_shared/presentation/user_agreement.dart';
import 'widgets/sign_in_button.dart';
import 'widgets/sign_up_button.dart';
import '../data/email_sign_up_repo.dart';
import '../domain/entity/email_sign_up_entity.dart';
import 'widgets/sign_up_mixin.dart';

class EmailTab extends StatefulWidget {
  const EmailTab({super.key});

  @override
  State<EmailTab> createState() => _EmailTabState();
}

class _EmailTabState extends State<EmailTab> with EmailSignUpMixin {
  late final EmailTextfield email = EmailTextfield(
    data: EmailTextfieldData(
      nextFocus: password.data.focusNode,
    ),
  );

  final entity = EmailSignUpEntity(
    remote: EmailSignUpRepo(
      gateway: appDi.core.get<CoreBackend>().gateway,
    ),
  );

  late final PasswordTextField password = PasswordTextField(
    data: PasswordTextfieldData(
      onSubmit: (value) {
        final emailData = email.data;
        final passwordData = password.data;
        emailData.clearErrors;
        passwordData.clearErrors;

        if (emailData.validate && passwordData.validate) {
          entity.add(
            DoSignUp(
              emailData.controller.text,
              passwordData.controller.text,
            ),
          );
        }
      },
    ),
  );

  final userAgreement = UserAgreement();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    userAgreement.dispose();
    entity.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: entity,
      child: BlocListener<EmailSignUpEntity, SignUpState>(
        bloc: entity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              email,
              const SizedBox(height: 14),
              password,
              const SizedBox(height: 25),
              Transform.translate(
                offset: const Offset(-10, 0),
                child: userAgreement,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 10),
                child: SignUpButton(
                  showCodeConfirmation: (resp) => showCodeConfirmation(
                    context,
                    resp,
                    email: email.data.controller.text,
                  ),
                  listenables: [
                    email.data.isValidated,
                    password.data.isValidated,
                    userAgreement.isValidated,
                  ],
                  onPressed: () {
                    final acc = email.data.validate;
                    final pass = password.data.validate;
                    if (acc == true && pass == true) {
                      entity.add(
                        DoSignUp(
                          email.data.controller.text,
                          password.data.controller.text,
                        ),
                      );
                    }
                  },
                  resetErrors: () {
                    email.data.clearErrors;
                    password.data.clearErrors;
                  },
                ),
              ),
              const SizedBox(height: 10),
              const SignInButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
        listener: (context, state) async {
          if (state is SignUpLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          if (state is SignUpError) {
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
              case final String error:
                ShowBanner.error(message: error);
              default:
                ShowBanner.error(
                  message: state.error.toErrorMessage(),
                );
            }
          } else if (state is SignUpUnauthorized &&
              state.resp?.timeout != null) {
            showCodeConfirmation(
              context,
              state.resp!,
              email: email.data.controller.text,
            );
          } else if (state is SignUpSuccess) {
            appDi.core.get<RemoteAuthEntity>().updateAuthVo(state.vo);
            CoreAuth.onSuccess?.call();
          }
        },
      ),
    );
  }
}
