// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class _MeasureRenderObject extends RenderProxyBox {
  _MeasureRenderObject(this.onChange);

  Size? oldSize;
  void Function(Size size) onChange;

  @override
  void performLayout() {
    super.performLayout();

    final newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class RenderObjectSize extends SingleChildRenderObjectWidget {
  const RenderObjectSize({
    required Widget super.child,
    required this.onChange,
    super.key,
  });

  final void Function(Size size) onChange;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MeasureRenderObject(onChange);
  }

  @override
  void updateRenderObject(BuildContext context, covariant _MeasureRenderObject renderObject) {
    renderObject.onChange = onChange;
  }
}
