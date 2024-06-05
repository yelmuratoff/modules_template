import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../shared/presentation/widgets/sms_verification/sms_verfication.dart';
import '../../../../../../l10n/generated/l10n.dart';
import '../../../../_shared/domain/value_objects/auth_response.dart';
import '../../domain/entity/email_sign_up_entity.dart';

mixin EmailSignUpMixin {
  void showCodeConfirmation(
    BuildContext context,
    AuthResponse resp, {
    required String email,
  }) {
    showSmsSheet(
      context,
      correctCode: resp.code,
      timeout: resp.timeout,
      title: L10n.current.enterEmailCode,
      subtitle: L10n.current.sentCodeTo(email),
      onRepeatSmsRequest: () {
        context.read<EmailSignUpEntity>().add(
              RetrySignUp(email: email),
            );
      },
      onSuccess: (_) {
        context.read<EmailSignUpEntity>().add(
              ConfirmSignUp(
                uid: resp.uid,
                code: int.parse(resp.code),
              ),
            );
      },
    );
  }
}
