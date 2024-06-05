import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../shared/utils/extensions/datetime.dart';
import '../../../../../../../l10n/generated/l10n.dart';
import '../../../../../../../theme/domain/interface/i_theme.dart';
import '../../../../../_shared/domain/value_objects/auth_response.dart';
import '../../domain/entity/email_recovery_entity.dart';

class RecoveryButton extends StatelessWidget {
  const RecoveryButton({
    required this.showSmsUi,
    required this.onPressed,
    required this.listenable,
    required this.resetErrors,
    super.key,
  });

  final ValueListenable<bool?> listenable;
  final VoidCallback onPressed;
  final VoidCallback resetErrors;
  final ValueChanged<AuthResponse> showSmsUi;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder<bool?>(
            valueListenable: listenable,
            builder: (context, isValidated, _) {
              return ElevatedButton(
                style: context.button.elevated1,
                onPressed: isValidated == true
                    ? () {
                        final vm = context.read<EmailRecoveryEntity>();
                        final timeout = vm.state.timeout?.remainingSeconds ?? 0;
                        if (timeout > 0) {
                          showSmsUi(
                            (vm.state as RecoveryUnauthorized).resp!,
                          );
                        } else {
                          onPressed();
                        }
                      }
                    : null,
                child: Text(L10n.current.sendCode),
              );
            },
          ),
        ),
      ],
    );
  }
}
