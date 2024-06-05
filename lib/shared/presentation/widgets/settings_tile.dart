import 'package:flutter/material.dart';

import '../../../core/theme/domain/interface/i_theme.dart';
import '../../assets.gen.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    this.type,
    this.subtitle,
    this.title,
    this.onPressed,
    this.value,
  });

  const SettingsTile.chevron({
    super.key,
    this.subtitle,
    this.title,
    this.onPressed,
    this.value,
  }) : type = SettingsTileType.chevron;

  const SettingsTile.switcher({
    super.key,
    this.subtitle,
    this.title,
    this.onPressed,
    this.value,
  }) : type = SettingsTileType.switcher;

  final VoidCallback? onPressed;
  final String? subtitle;
  final String? title;
  final SettingsTileType? type;
  final bool? value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          0,
          subtitle == null ? 16 : 8,
          16,
          subtitle == null ? 16 : 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Semantics(
                enabled: true,
                explicitChildNodes: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: context.text.s16w500,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 5),
                      Text(
                        subtitle!,
                        style: context.text.s12w500.copyWith(
                          color: context.color.grey900,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            if (type == SettingsTileType.chevron)
              Assets.shared.icons.chevronRight.svg(),
            if (type == SettingsTileType.switcher)
              Switch(
                value: value ?? false,
                activeColor: context.color.accent,
                activeTrackColor: context.color.accent.withOpacity(0.12),
                onChanged: (v) {
                  onPressed?.call();
                },
              ),
          ],
        ),
      ),
    );
  }
}

enum SettingsTileType { chevron, switcher }
