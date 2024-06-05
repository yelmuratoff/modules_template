import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/l10n/generated/l10n.dart';
import '../../../../../../../shared/assets.gen.dart';
import '../../../../../../../shared/presentation/widgets/dialogs/app_dialog_extra.dart';
import '../../../../../../../shared/presentation/widgets/sms_verification/sms_verfication.dart';
import '../../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../domain/entity/phone_change_entity.dart';
import '../../domain/value_objects/response.dart';

mixin PhoneChangeMixin {
  void showCodeConfirmation(BuildContext context, Response resp) {
    showSmsSheet(
      context,
      correctCode: resp.code.toString(),
      timeout: resp.timeout,
      title: L10n.current.enterSmsCode,
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
      body: L10n.current.phoneNumberSaved,
      actionsBuilder: (context) {
        return [
          DialogButton(
            label: L10n.current.ok,
            style: context.button.text1,
            onPressed: Navigator.of(context).pop,
          ),
        ];
      },
    );
  }
}
