import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../_shared/widgets/sms_verification/sms_verfication.dart';
import '../../../../../../../l10n/l10n_helper.dart';
import '../../../../../../../navigation/navigator1_helper.dart';
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
      title: context.s.enterSmsCode,
      subtitle: context.s.sentCodeTo(phone),
      onRepeatSmsRequest: () => recoverPassword(context, phone),
      onSuccess: (_) {
        context.router.use.push(
          SetNewPasswordScreen(resp: resp),
        );
      },
    );
  }
}
