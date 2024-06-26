import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../shared/presentation/widgets/sms_verification/sms_verfication.dart';
import '../../../../../../../l10n/generated/l10n.dart';
import '../../../../../../../router/navigator1_helper.dart';
import '../../../../../_shared/domain/value_objects/auth_response.dart';
import '../../../../set_new_password/ui/set_new_password_screen.dart';
import '../../domain/entity/email_recovery_entity.dart';

mixin EmailRecoveryMixin {
  void recoverPassword(BuildContext context, String email) {
    context.read<EmailRecoveryEntity>().add(
          DoRecovery(email),
        );
  }

  void showSmsUi(BuildContext context, AuthResponse resp, String email) {
    showSmsSheet(
      context,
      correctCode: resp.code,
      timeout: resp.timeout,
      title: L10n.current.enterEmailCode,
      subtitle: L10n.current.sentCodeTo(email),
      onRepeatSmsRequest: () => recoverPassword(context, email),
      onSuccess: (_) {
        context.router.use.push(
          SetNewPasswordScreen(resp: resp),
        );
      },
    );
  }
}
