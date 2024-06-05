import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../../../shared/presentation/widgets/banners/show_banner.dart';
import '../../../../../../../shared/presentation/widgets/text_fields/email_textfield.dart';
import '../../../../../../di/di.dart';
import '../../../../../../../shared/exceptions/app_exception.dart';
import '../../../../../../../shared/utils/extensions/object_to_error.dart';
import '../../../../../../api/backend/domain/entity/core_backend.dart';
import '../data/email_recovery_repo.dart';
import '../domain/entity/email_recovery_entity.dart';
import 'widgets/recovery_button.dart';
import 'widgets/email_recovery_mixin.dart';

class EmailTab extends StatefulWidget {
  const EmailTab({super.key});

  @override
  State<EmailTab> createState() => _EmailTabState();
}

class _EmailTabState extends State<EmailTab> with EmailRecoveryMixin {
  final email = EmailTextfield();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailRecoveryEntity(
        remote: EmailRecoveryRepo(
          gateway: appDi.core.get<CoreBackend>().gateway,
        ),
        timeOut: const Duration(seconds: 60),
      ),
      child: Builder(
        builder: (context) {
          return BlocListener<EmailRecoveryEntity, RecoveryState>(
            child: Column(
              children: [
                const SizedBox(height: 25),
                email,
                const Spacer(),
                RecoveryButton(
                  listenable: email.data.isValidated,
                  showSmsUi: (resp) => showSmsUi(
                    context,
                    resp,
                    email.data.controller.text,
                  ),
                  onPressed: () => recoverPassword(
                    context,
                    email.data.controller.text,
                  ),
                  resetErrors: () {
                    email.data.clearErrors;
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
            listener: (context, state) {
              if (state is RecoveryLoading) {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                FocusScope.of(context).unfocus();
                context.loaderOverlay.show();
              } else {
                context.loaderOverlay.hide();
              }
              if (state is RecoveryError) {
                ShowBanner.hide();
                switch (state.error) {
                  case final AuthException error:
                    if (error.message != null) {
                      ShowBanner.error(message: error.message);
                    }
                    if (error.email != null) {
                      email.data.showErrors(error.email);
                    }

                    break;
                  case final String error:
                    ShowBanner.error(message: error);
                  default:
                    ShowBanner.error(
                      message: state.error.toErrorMessage(),
                    );
                }
              }
              if (state is RecoveryUnauthorized &&
                  state.resp?.timeout != null) {
                showSmsUi(
                  context,
                  state.resp!,
                  email.data.controller.text,
                );
              }
            },
          );
        },
      ),
    );
  }
}
