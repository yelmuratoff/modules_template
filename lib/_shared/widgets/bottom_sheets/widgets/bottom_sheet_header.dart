import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_helper.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import '../../../assets.gen.dart';
import '../../app_unfocuser.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    super.key,
    this.title,
    this.closeIcon,
  });

  final Widget? closeIcon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: title == null
              ? const SizedBox.shrink()
              : Semantics(
                  label: context.s.closeModal,
                  child: Text(
                    title!,
                    style: context.text.hs20w700,
                  ),
                ),
        ),
        AppUnfocuser(
          child: Semantics(
            label: context.s.closeModal,
            child: IconButton(
              splashRadius: 20,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: closeIcon ?? Assets.shared.icons.close.svg(),
            ),
          ),
        ),
      ],
    );
  }
}
