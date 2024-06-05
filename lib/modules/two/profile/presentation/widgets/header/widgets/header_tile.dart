import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/l10n/generated/l10n.dart';
import '../../../../../../../shared/assets.gen.dart';
import '../../../../../../../core/theme/domain/interface/i_theme.dart';

class HeaderTile extends StatelessWidget {
  const HeaderTile({
    required this.label,
    required this.onPressed,
    super.key,
    this.value,
    this.isLoading = false,
  });

  final String? value;
  final bool isLoading;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 8),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: context.text.s14w400.copyWith(
                color: context.color.grey900,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: isLoading
                  ? Shimmer.fromColors(
                      baseColor: context.color.background,
                      highlightColor: context.color.grey900,
                      child: Text(
                        L10n.current.noData,
                        textAlign: TextAlign.end,
                        style: context.text.s14w400,
                      ),
                    )
                  : Text(
                      value ?? L10n.current.noData,
                      textAlign: TextAlign.end,
                      style: context.text.s14w400,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                    ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            customBorder: const CircleBorder(),
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.all(5.5),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: context.color.accentBg,
                shape: BoxShape.circle,
              ),
              child: Assets.shared.icons.edit.svg(
                colorFilter: ColorFilter.mode(
                  context.color.accent,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
