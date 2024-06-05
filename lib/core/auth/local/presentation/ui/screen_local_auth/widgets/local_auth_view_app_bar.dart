import 'package:flutter/material.dart';

import '../../../../../../../shared/assets.gen.dart';
import '../../../../../../l10n/generated/l10n.dart';
import '../../../../../../theme/domain/interface/i_theme.dart';

class LocalAuthViewAppBar extends StatelessWidget {
  const LocalAuthViewAppBar({
    super.key,
    this.title,
    this.onPop,
    this.onCancel,
  });

  final VoidCallback? onCancel;
  final VoidCallback? onPop;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onPop == null)
          const SizedBox(
            width: 46,
            height: 46,
          )
        else
          Semantics(
            label: L10n.current.closePermAlert,
            child: IconButton(
              icon: Assets.shared.icons.chevronLeft.svg(),
              color: context.color.background,
              onPressed: onPop,
            ),
          ),
        if (title == null)
          const Spacer()
        else
          Expanded(
            child: Text(
              title!,
              style: context.text.hs16w700,
              textAlign: TextAlign.center,
            ),
          ),
        if (onCancel == null)
          const SizedBox(width: 46, height: 46)
        else
          IconButton(
            icon: Assets.shared.icons.cancel.svg(),
            color: context.color.background,
            onPressed: onCancel,
          ),
      ],
    );
  }
}
