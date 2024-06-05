import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/domain/interface/i_theme.dart';

class QuantifierButton extends StatefulWidget {
  const QuantifierButton({
    required this.icon,
    required this.onPressed,
    this.enabled = true,
    super.key,
  });

  final bool enabled;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  State<QuantifierButton> createState() => _QuantifierButtonState();
}

class _QuantifierButtonState extends State<QuantifierButton> {
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Timer callRepeatedly(VoidCallback callback, [int milliseconds = 200]) {
    return Timer.periodic(
      Duration(milliseconds: milliseconds),
      (t) {
        callback();
        // If user holds the button,
        // increase the speed of the counter every 2 seconds
        if (t.tick > 2000 / milliseconds) {
          timer?.cancel();
          timer = callRepeatedly(
            callback,
            milliseconds.clamp(100, double.infinity) ~/ 1.5,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTapDown: widget.enabled
            ? (_) {
                widget.onPressed.call();
                timer = callRepeatedly(widget.onPressed);
              }
            : null,
        onTapUp: (_) {
          timer?.cancel();
          timer = null;
        },
        onTapCancel: () {
          timer?.cancel();
          timer = null;
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Ink(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color:
                  widget.enabled ? context.color.accent : context.color.grey300,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconTheme(
              data: IconThemeData(
                color: context.color.background,
              ),
              child: widget.icon,
            ),
          ),
        ),
      ),
    );
  }
}
