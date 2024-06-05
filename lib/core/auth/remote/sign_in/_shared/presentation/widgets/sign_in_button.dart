import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../../shared/presentation/widgets/multi_value_listenable_builder.dart';
import '../../../../../../l10n/generated/l10n.dart';
import '../../../../../../theme/domain/interface/i_theme.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    required this.onPressed,
    required this.listenables,
    super.key,
  });

  final List<ValueListenable<bool?>> listenables;
  final VoidCallback onPressed;

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
                onPressed: isValid ? onPressed : null,
                child: Text(L10n.current.signin),
              );
            },
          ),
        ),
      ],
    );
  }
}
