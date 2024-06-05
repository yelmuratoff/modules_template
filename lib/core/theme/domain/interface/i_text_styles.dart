import 'package:flutter/material.dart';

///Example \
///Body text style:
///`s12w700 = TextStyle(fontSize: 12, fontWeight: FontWeight.w700);`
///Header text style
///`hs14w500 = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Inter');`
abstract class ITextStyles extends ThemeExtension<ITextStyles> {
  abstract final TextStyle error;
  abstract final TextStyle hs16w700;
  abstract final TextStyle hs20w700;
  abstract final TextStyle hs24w700;
  abstract final TextStyle s10w500;
  abstract final TextStyle s12w400;
  abstract final TextStyle s12w500;
  abstract final TextStyle s12w700;
  abstract final TextStyle s14w400;
  abstract final TextStyle s14w500;
  abstract final TextStyle s14w700;
  abstract final TextStyle s16w400;
  abstract final TextStyle s16w500;
  abstract final TextStyle s16w600;
  abstract final TextStyle s16w700;
  abstract final TextStyle s20w700;
  abstract final TextStyle s24w700;
  abstract final TextStyle s36w400;
}
