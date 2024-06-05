import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../../../_shared/widgets/banners/show_banner.dart';
import '../../../../../../../_shared/widgets/text_fields/phone_textfield.dart';
import '../../../../../../../di.dart';
import '../../../../../../_shared/exceptions/app_exception.dart';
import '../../../../../../_shared/utils/extensions/object_to_error.dart';
import '../../../../../../network/backend/domain/entity/core_backend.dart';
import '../../email/presentation/widgets/recovery_button.dart';
import '../data/phone_recovery_repo.dart';
import '../domain/entity/auth_recovery_entity.dart';
import 'widgets/phone_recovery_mixin.dart';

class PhoneTab extends StatefulWidget {
  const PhoneTab({super.key});

  @override
  State<PhoneTab> createState() => _PhoneTabState();
}

class _PhoneTabState extends State<PhoneTab> with PhoneRecoveryMixin {
  final phone = PhoneTextfield();

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneRecoveryEntity(
        remote: PhoneRecoveryRepo(
          gateway: appDi.core.get<CoreBackend>().gateway,
        ),
        timeOut: const Duration(seconds: 60),
      ),
      child: Builder(
        builder: (context) {
          return BlocListener<PhoneRecoveryEntity, RecoveryState>(
            child: Column(
              children: [
                const SizedBox(height: 25),
                phone,
                const Spacer(),
                RecoveryButton(
                  listenable: phone.data.isValidated,
                  showSmsUi: (resp) => showSmsUi(
                    context,
                    resp,
                    phone.data.controller.text,
                  ),
                  onPressed: () => recoverPassword(
                    context,
                    phone.data.controller.text,
                  ),
                  resetErrors: () => phone.data.clearErrors,
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
                    if (error.phone != null) {
                      phone.data.showErrors(error.phone);
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
                  phone.data.controller.text,
                );
              }
            },
          );
        },
      ),
    );
  }
}
