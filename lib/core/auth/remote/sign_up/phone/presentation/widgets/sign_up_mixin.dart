import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../_shared/widgets/sms_verification/sms_verfication.dart';
import '../../../../../../l10n/l10n_helper.dart';
import '../../../../_shared/domain/value_objects/auth_response.dart';
import '../../domain/entity/phone_sign_up_entity.dart';

mixin PhoneSignUpMixin {
  void showCodeConfirmation(
    BuildContext context,
    AuthResponse resp, {
    required String phone,
  }) {
    showSmsSheet(
      context,
      correctCode: resp.code,
      timeout: resp.timeout,
      title: context.s.enterSmsCode,
      subtitle: context.s.sentCodeTo(phone),
      onRepeatSmsRequest: () => signUpRetry(context, phone),
      onSuccess: (_) {
        context.read<PhoneSignUpEntity>().add(
              ConfirmSignUp(
                uid: resp.uid,
                code: int.parse(resp.code),
              ),
            );
      },
    );
  }

  void signUp(BuildContext context, String phone, String password) {
    context.read<PhoneSignUpEntity>().add(
          DoSignUp(phone, password),
        );
  }

  static void signUpRetry(BuildContext context, String phone) {
    context.read<PhoneSignUpEntity>().add(
          RetrySignUp(phone: phone),
        );
  }
}
