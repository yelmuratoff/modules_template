import 'package:flutter/material.dart';

import '../../../../../shared/fonts.gen.dart';
import '../../../../../core/di/module/switcher/domain/value_objects/app_module.dart';
import '../../../../../core/theme/domain/interface/i_theme.dart';
import 'theme_button_styles.dart';
import 'theme_colors.dart';
import 'theme_text_styles.dart';

class OneTheme implements ITheme {
  @override
  late final data = ThemeData(
    brightness: Brightness.light,
    fontFamily: FontFamily.inter,
    useMaterial3: true,
    primaryColor: _color.accent,
    colorScheme: ColorScheme.fromSeed(
      primary: _color.accent,
      seedColor: _color.accent,
      error: _color.error,
    ),
    hintColor: _color.grey700,
    canvasColor: _color.background,
    textButtonTheme: TextButtonThemeData(
      style: _button.text2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _button.elevated1,
    ),
    textTheme: TextTheme(
      bodyLarge: _text.s14w400,
      bodyMedium: _text.s14w400,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: _color.accent,
      linearMinHeight: 2,
    ),
    extensions: <ThemeExtension>[
      _color,
      _text,
      _button,
    ],
  );

  late final _button = ThemeButtonStyles(_color, _text);
  final _color = const ThemeColors();
  late final _text = ThemeTextStyles(_color);

  @override
  String get id => 'OneTheme';

  @override
  AppModule get module => AppModule.one;
}
