import 'package:flutter/material.dart';

class PaginationIndicator extends StatelessWidget {
  const PaginationIndicator({
    required this.child,
    required this.enabled,
    this.position = AxisDirection.down,
    super.key,
  });

  final Widget child;
  final AxisDirection position;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (enabled)
          Positioned(
            bottom: position == AxisDirection.up ? null : 0,
            left: position == AxisDirection.right ? null : 0,
            right: position == AxisDirection.left ? null : 0,
            top: position == AxisDirection.down ? null : 0,
            child: const LinearProgressIndicator(),
          ),
      ],
    );
  }
}
