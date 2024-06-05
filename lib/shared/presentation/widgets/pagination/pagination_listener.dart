import 'package:flutter/material.dart';

///Listens to the scroll and calls [onEdge]
///when the scroll reaches the edge. \
///Can fire many times
///(intended to be used with a droppable() transformer)
class PaginationListener extends StatefulWidget {
  const PaginationListener({
    required this.child,
    required this.onEdge,
    this.margin = 0,
    super.key,
  });

  final Widget child;

  ///Distance from the edge before calling [onEdge].
  ///Used to call [onEdge] before the edge is reached
  ///(for smoother pagination experience)
  final double margin;

  final VoidCallback onEdge;

  @override
  State<PaginationListener> createState() => _PaginationListenerState();
}

class _PaginationListenerState extends State<PaginationListener> {
  double _lastScrollPosition = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notif) {
        if (notif is! ScrollUpdateNotification) return false;
        final scrollsForward = notif.metrics.pixels > _lastScrollPosition;
        _lastScrollPosition = notif.metrics.pixels;
        if (!scrollsForward) return false;
        if (notif.metrics.outOfRange) return false;
        var maxScrollExtent = notif.metrics.maxScrollExtent - widget.margin;
        maxScrollExtent = maxScrollExtent.clamp(0, double.maxFinite);
        if (notif.metrics.pixels < maxScrollExtent) return false;
        widget.onEdge();
        return false;
      },
      child: widget.child,
    );
  }
}
