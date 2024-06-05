import 'package:flutter/material.dart';

import '../../../core/theme/domain/interface/i_theme.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.color,
    this.height,
    this.margin,
  });

  final Color? color;
  final double? height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      height: height ?? 1,
      color: color ?? context.color.grey300,
    );
  }
}
