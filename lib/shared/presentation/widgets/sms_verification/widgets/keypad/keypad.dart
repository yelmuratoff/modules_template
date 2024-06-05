import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../../assets.gen.dart';
import 'keypad_button.dart';

class Keypad extends StatelessWidget {
  Keypad({
    required this.onAddDigit,
    required this.onRemoveDigit,
    super.key,
    this.randomizeColors = false,
    this.aspectRatio = 1.5,
    this.decoration,
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.all(10),
    this.style,
    this.leftButton,
    this.rightButton,
  });

  final double aspectRatio;
  final BoxDecoration? decoration;
  final KeypadButton? leftButton;
  final EdgeInsets? margin;
  final ValueChanged<int> onAddDigit;
  final VoidCallback onRemoveDigit;
  final EdgeInsets? padding;
  final random = Random();
  final bool randomizeColors;
  final KeypadButton? rightButton;
  final TextStyle? style;

  Color get randomColor => Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      );

  BoxDecoration _decoration(BuildContext context) {
    return decoration?.copyWith(
          color: randomizeColors ? randomColor : null,
        ) ??
        BoxDecoration(
          color: randomizeColors ? randomColor : Colors.transparent,
          border: Border.all(
            color: context.color.grey300,
          ),
          borderRadius: BorderRadius.circular(12),
        );
  }

  @override
  Widget build(BuildContext context) {
    final keys = List.generate(
      10,
      (index) {
        return Expanded(
          child: KeypadButton(
            aspectRatio: aspectRatio,
            digit: index,
            padding: padding,
            margin: margin,
            textStyle: context.text.hs24w700.copyWith(
              color: context.color.grey900,
            ),
            decoration: _decoration(context),
            onPressed: (context) => onAddDigit(index),
          ),
        );
      },
    );
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [keys[1], keys[2], keys[3]],
          ),
          Row(
            children: [keys[4], keys[5], keys[6]],
          ),
          Row(
            children: [keys[7], keys[8], keys[9]],
          ),
          Row(
            children: [
              Expanded(
                child: leftButton ?? const SizedBox.shrink(),
              ),
              keys[0],
              Expanded(
                child: rightButton ??
                    KeypadButton(
                      aspectRatio: aspectRatio,
                      icon: Assets.shared.icons.backspace.svg(
                        width: 28,
                        height: 28,
                        colorFilter: ColorFilter.mode(
                          context.color.grey900,
                          BlendMode.srcIn,
                        ),
                      ),
                      decoration: _decoration(context),
                      margin: margin,
                      padding: padding,
                      onPressed: (context) {
                        onRemoveDigit();
                      },
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
