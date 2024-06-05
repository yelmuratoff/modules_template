import 'package:flutter/material.dart';

class AppUnfocuser extends StatelessWidget {
  const AppUnfocuser({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      excludeFromSemantics: true,
      behavior: HitTestBehavior.translucent,
      child: child,
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          // currentFocus.focusedChild!.unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
    );
  }
}

mixin AppUnfocuserMixin {
  void unfocus(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      // currentFocus.focusedChild!.unfocus();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
