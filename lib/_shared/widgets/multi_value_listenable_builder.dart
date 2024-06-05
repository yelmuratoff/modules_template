import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MultiValueListenableBuilder<T> extends StatelessWidget {
  const MultiValueListenableBuilder({
    required this.valueListenables,
    required this.builder,
    super.key,
    this.child,
  });

  final Widget Function(
    BuildContext context,
    List<T> values,
    Widget? child,
  ) builder;

  final Widget? child;
  final List<ValueListenable<T>> valueListenables;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(valueListenables),
      builder: (context, child) {
        final list = valueListenables.map((listenable) => listenable.value);
        return builder(
          context,
          List.unmodifiable(list),
          child,
        );
      },
      child: child,
    );
  }
}
