import 'package:flutter/material.dart';

import '../../../core/theme/domain/interface/i_theme.dart';
import '../../fonts.gen.dart';

class AppTabBar extends TabBar {
  AppTabBar({
    required super.tabs,
    required ThemeData theme,
    super.key,
    super.controller,
    super.padding = EdgeInsets.zero,
    super.labelPadding = const EdgeInsets.symmetric(
      horizontal: 10,
    ),
  }) : super(
          isScrollable: true,
          unselectedLabelColor: theme.color.grey700,
          unselectedLabelStyle: theme.text.s16w600.copyWith(
            color: theme.color.accent,
          ),
          labelStyle: theme.text.s16w600.copyWith(
            color: theme.color.accent,
          ),
          labelColor: theme.color.accent,
          splashBorderRadius: BorderRadius.circular(12),
        );

  AppTabBar.chips({
    required super.tabs,
    required ThemeData theme,
    super.key,
    super.controller,
    super.padding = EdgeInsets.zero,
    super.indicatorSize = TabBarIndicatorSize.tab,
    super.dividerHeight = 0,
  }) : super(
          isScrollable: true,
          unselectedLabelColor: theme.color.grey700,
          unselectedLabelStyle: theme.text.s16w600.copyWith(
            color: theme.color.accent,
            fontFamily: FontFamily.montserratAlternates,
          ),
          labelStyle: theme.text.s16w600.copyWith(
            color: theme.color.accent,
            fontFamily: FontFamily.montserratAlternates,
          ),
          labelColor: theme.color.accent,
          splashBorderRadius: BorderRadius.circular(12),
          indicator: BoxDecoration(
            color: theme.color.accentBg,
            border: Border.all(
              color: theme.color.accent,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        );
}
