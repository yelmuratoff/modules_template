import 'package:flutter/material.dart';

import '../../../../../shared/assets.gen.dart';
import '../../../../../shared/presentation/widgets/divider.dart';
import '../../../../../core/theme/domain/interface/i_theme.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    this.title,
    this.icon,
    this.onPressed,
    this.isFirst = false,
    this.isLast = false,
  });

  final Widget? icon;
  final bool isFirst;
  final bool isLast;
  final VoidCallback? onPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isFirst) const AppDivider(),
        InkWell(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(isFirst ? 16 : 0),
            bottom: Radius.circular(isLast ? 16 : 0),
          ),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                if (icon != null)
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.color.grey300,
                      ),
                      shape: BoxShape.circle,
                      color: context.color.accentBg,
                    ),
                    padding: const EdgeInsets.all(7),
                    child: icon,
                  ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title ?? '',
                    style: context.text.s16w500,
                  ),
                ),
                Assets.shared.icons.chevronRight.svg(height: 17),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
