import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../shared/presentation/widgets/sms_verification/sms_verfication.dart';
import '../../../../../../../l10n/generated/l10n.dart';
import '../../../../../../../router/navigator1_helper.dart';
import '../../../../../_shared/domain/value_objects/auth_response.dart';
import '../../../../set_new_password/ui/set_new_password_screen.dart';
import '../../domain/entity/auth_recovery_entity.dart';

mixin PhoneRecoveryMixin {
  void recoverPassword(BuildContext context, String phone) {
    context.read<PhoneRecoveryEntity>().add(
          DoRecovery(phone),
        );
  }

  void showSmsUi(BuildContext context, AuthResponse resp, String phone) {
    showSmsSheet(
      context,
      correctCode: resp.code,
      timeout: resp.timeout,
      title: L10n.current.enterSmsCode,
      subtitle: L10n.current.sentCodeTo(phone),
      onRepeatSmsRequest: () => recoverPassword(context, phone),
      onSuccess: (_) {
        context.router.use.push(
          SetNewPasswordScreen(resp: resp),
        );
      },
    );
  }
}
