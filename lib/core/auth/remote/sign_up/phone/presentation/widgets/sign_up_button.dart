import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../shared/presentation/widgets/multi_value_listenable_builder.dart';
import '../../../../../../../shared/utils/extensions/datetime.dart';
import '../../../../../../l10n/generated/l10n.dart';
import '../../../../../../theme/domain/interface/i_theme.dart';
import '../../../../_shared/domain/value_objects/auth_response.dart';
import '../../domain/entity/phone_sign_up_entity.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    required this.onPressed,
    required this.listenables,
    required this.resetErrors,
    required this.showCodeConfirmation,
    super.key,
  });

  final List<ValueListenable<bool?>> listenables;
  final VoidCallback onPressed;
  final VoidCallback resetErrors;
  final ValueChanged<AuthResponse> showCodeConfirmation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MultiValueListenableBuilder<bool?>(
            valueListenables: listenables,
            builder: (context, values, _) {
              final isValid =
                  values.isNotEmpty && values.every((item) => item == true);
              return ElevatedButton(
                style: context.button.elevated1,
                onPressed: isValid
                    ? () {
                        ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner();
                        FocusScope.of(context).unfocus();
                        resetErrors();
                        final bloc = context.read<PhoneSignUpEntity>();
                        final timeout =
                            bloc.state.timeout?.remainingSeconds ?? 0;
                        if (timeout > 0) {
                          showCodeConfirmation(
                            (bloc.state as SignUpUnauthorized).resp!,
                          );
                        } else {
                          onPressed();
                        }
                      }
                    : null,
                child: Text(L10n.current.signin),
              );
            },
          ),
        ),
      ],
    );
  }
}
