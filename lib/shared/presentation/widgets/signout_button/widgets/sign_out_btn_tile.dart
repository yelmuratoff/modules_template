import 'package:flutter/material.dart';

import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../assets.gen.dart';

class SignOutBtnTile extends StatelessWidget {
  const SignOutBtnTile({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.color.background,
          border: Border.all(
            color: context.color.grey300,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              spreadRadius: -4,
              blurRadius: 16,
              color: context.color.shadow.withOpacity(.14),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.color.grey300,
                ),
                shape: BoxShape.circle,
                color: context.color.errorBg,
              ),
              padding: const EdgeInsets.all(7),
              child: Assets.shared.icons.signout.svg(),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                L10n.current.signout,
                style: context.text.s16w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
