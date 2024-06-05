import 'package:flutter/material.dart';

import '../../../di/module/switcher/domain/value_objects/app_module.dart';
import 'i_button_styles.dart';
import 'i_colors.dart';
import 'i_text_styles.dart';

abstract class ITheme {
  abstract final ThemeData data;
  abstract final String id;
  abstract final AppModule module;
}

extension ThemeUtils on BuildContext {
  IColors get color => Theme.of(this).extension<IColors>()!;
  ITextStyles get text => Theme.of(this).extension<ITextStyles>()!;
  IButtonStyles get button => Theme.of(this).extension<IButtonStyles>()!;
  ThemeData get theme => Theme.of(this);
}

extension ThemeDataUtils on ThemeData {
  IColors get color => extension<IColors>()!;
  ITextStyles get text => extension<ITextStyles>()!;
  IButtonStyles get button => extension<IButtonStyles>()!;
}
