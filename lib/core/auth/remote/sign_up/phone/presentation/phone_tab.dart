import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../../_shared/widgets/banners/show_banner.dart';
import '../../../../../../_shared/widgets/text_fields/password_text_field.dart';
import '../../../../../../_shared/widgets/text_fields/phone_textfield.dart';
import '../../../../../../di.dart';
import '../../../../../_shared/exceptions/app_exception.dart';
import '../../../../../_shared/utils/extensions/object_to_error.dart';
import '../../../../../network/backend/domain/entity/core_backend.dart';
import '../../../../combined/presentation/core_auth.dart';
import '../../../_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../_shared/presentation/user_agreement.dart';
import '../data/phone_sign_up_repo.dart';
import '../domain/entity/phone_sign_up_entity.dart';
import 'widgets/sign_in_button.dart';
import 'widgets/sign_up_button.dart';
import 'widgets/sign_up_mixin.dart';

class PhoneTab extends StatefulWidget {
  const PhoneTab({super.key});

  @override
  State<PhoneTab> createState() => _PhoneTabState();
}

class _PhoneTabState extends State<PhoneTab> with PhoneSignUpMixin {
  late final PhoneTextfield phone = PhoneTextfield(
    data: PhoneTextfieldData(
      nextFocus: password.data.focusNode,
    ),
  );

  final entity = PhoneSignUpEntity(
    remote: PhoneSignUpRepo(
      gateway: appDi.core.get<CoreBackend>().gateway,
    ),
  );

  late final PasswordTextField password = PasswordTextField(
    data: PasswordTextfieldData(
      onSubmit: (value) {
        final phoneData = phone.data;
        final passwordData = password.data;
        phoneData.clearErrors;
        passwordData.clearErrors;

        if (phoneData.validate && passwordData.validate) {
          entity.add(
            DoSignUp(
              phoneData.controller.text,
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
    phone.dispose();
    password.dispose();
    userAgreement.dispose();
    entity.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: entity,
      child: Builder(
        builder: (context) {
          return BlocListener<PhoneSignUpEntity, SignUpState>(
            bloc: entity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  phone,
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
                        phone: phone.data.controller.text,
                      ),
                      listenables: [
                        phone.data.isValidated,
                        password.data.isValidated,
                        userAgreement.isValidated,
                      ],
                      onPressed: () {
                        final acc = phone.data.validate;
                        final pass = password.data.validate;
                        if (acc == true && pass == true) {
                          entity.add(
                            DoSignUp(
                              phone.data.controller.text,
                              password.data.controller.text,
                            ),
                          );
                        }
                      },
                      resetErrors: () {
                        phone.data.clearErrors;
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
                    if (error.phone != null) {
                      phone.data.showErrors(error.email);
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
                  phone: phone.data.controller.text,
                );
              } else if (state is SignUpAuthorized) {
                appDi.core.get<RemoteAuthEntity>().updateAuthVo(state.vo);
                CoreAuth.onSuccess?.call();
              }
            },
          );
        },
      ),
    );
  }
}
