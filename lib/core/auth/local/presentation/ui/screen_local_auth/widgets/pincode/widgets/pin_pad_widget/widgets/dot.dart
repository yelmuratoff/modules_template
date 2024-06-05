import 'package:flutter/material.dart';

class PincodeDot extends StatelessWidget {
  const PincodeDot({
    required this.size,
    required this.activeColor,
    required this.inactiveColor,
    required this.errorColor,
    super.key,
    this.value,
    this.isInvalid,
  });

  final Color activeColor;
  final Color errorColor;
  final Color inactiveColor;
  final bool? isInvalid;
  final Size size;
  final int? value;

  @override
  Widget build(BuildContext context) {
    var color = (isInvalid ?? false) ? errorColor : activeColor;
    if (value == null) {
      color = inactiveColor;
    }
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
