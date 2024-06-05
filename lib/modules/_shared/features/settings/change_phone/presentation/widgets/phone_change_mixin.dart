import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../_shared/assets.gen.dart';
import '../../../../../../../_shared/widgets/dialogs/app_dialog_extra.dart';
import '../../../../../../../_shared/widgets/sms_verification/sms_verfication.dart';
import '../../../../../../../core/l10n/l10n_helper.dart';
import '../../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../domain/entity/phone_change_entity.dart';
import '../../domain/value_objects/response.dart';

mixin PhoneChangeMixin {
  void showCodeConfirmation(BuildContext context, Response resp) {
    showSmsSheet(
      context,
      correctCode: resp.code.toString(),
      timeout: resp.timeout,
      title: context.s.enterSmsCode,
      subtitle: resp.message,
      onRepeatSmsRequest: () {
        context.read<PhoneChangeEntity>().add(
              RequestChange(resp.phone),
            );
      },
      onSuccess: (_) {
        context.read<PhoneChangeEntity>().add(
              ConfirmChange(
                code: resp.code.toString(),
                phone: resp.phone,
              ),
            );
      },
    );
  }

  Future<void> showSuccessMessage(BuildContext context) {
    return showAppDialogExtra(
      context,
      icon: Assets.shared.icons.check.svg(),
      body: context.s.phoneNumberSaved,
      actionsBuilder: (context) {
        return [
          DialogButton(
            label: context.s.ok,
            style: context.button.text1,
            onPressed: Navigator.of(context).pop,
          ),
        ];
      },
    );
  }
}
