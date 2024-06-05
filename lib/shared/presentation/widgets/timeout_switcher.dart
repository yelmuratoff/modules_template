import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/extensions/datetime.dart';

class TimeoutSwitcher extends StatefulWidget {
  const TimeoutSwitcher({
    required this.before,
    required this.after,
    super.key,
    this.timeout,
  });

  final Widget after;
  final Widget Function(int remaining) before;
  final DateTime? timeout;

  @override
  State<TimeoutSwitcher> createState() => _TimeoutSwitcherState();
}

class _TimeoutSwitcherState extends State<TimeoutSwitcher> {
  int? secondsRemaining;

  @override
  void initState() {
    final remaining = widget.timeout?.remainingSeconds;
    if (remaining == null || remaining == 0) return;
    if (remaining > 0) {
      secondsRemaining = remaining;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startTimer(remaining);
      });
    }
    super.initState();
  }

  void _startTimer(int timeoutSeconds) {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (mounted) {
          setState(() {
            if (timer.tick >= timeoutSeconds) {
              timer.cancel();
              secondsRemaining = null;
            } else {
              secondsRemaining = timeoutSeconds - timer.tick;
            }
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        child: child,
      ),
      layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
        return Column(
          children: <Widget>[
            if (currentChild != null) currentChild,
            ...previousChildren,
          ],
        );
      },
      child: secondsRemaining != null
          ? widget.before(secondsRemaining!)
          : widget.after,
    );
  }
}
