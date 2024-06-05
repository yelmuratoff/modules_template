import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    required this.label,
    this.onPressed,
    this.style,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
        onPressed: onPressed,
        style: style,
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
