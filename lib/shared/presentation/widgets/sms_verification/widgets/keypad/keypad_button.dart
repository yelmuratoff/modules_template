// ignore_for_file: use_decorated_box

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/theme/domain/interface/i_theme.dart';

class KeypadButton extends StatelessWidget {
  const KeypadButton({
    required this.onPressed,
    super.key,
    this.digit = 0,
    this.icon,
    this.aspectRatio = 1.0,
    this.decoration,
    this.padding,
    this.margin,
    this.textStyle,
  });

  final double aspectRatio;
  final BoxDecoration? decoration;
  final int digit;
  final Widget? icon;
  final EdgeInsets? margin;
  final ValueChanged<BuildContext> onPressed;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          decoration: decoration,
          child: InkWell(
            splashColor: context.color.grey700,
            borderRadius: BorderRadius.circular(12),
            customBorder: RoundedRectangleBorder(
              borderRadius: decoration?.borderRadius ?? BorderRadius.zero,
            ),
            onTap: () {
              HapticFeedback.lightImpact();
              onPressed(context);
            },
            child: Center(
              child: icon ??
                  Text(
                    digit.toString(),
                    style: textStyle,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
