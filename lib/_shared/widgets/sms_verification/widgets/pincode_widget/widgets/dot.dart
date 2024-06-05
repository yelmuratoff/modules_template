import 'package:flutter/material.dart';

import '../../../../../../core/theme/domain/interface/i_theme.dart';

class PincodeDot extends StatelessWidget {
  const PincodeDot({
    super.key,
    this.value,
    this.isInvalid,
  });

  final int? value;
  final bool? isInvalid;

  @override
  Widget build(BuildContext context) {
    var color =
        (isInvalid ?? false) ? context.color.error : context.color.textPrimary;
    if (value == null) {
      color = context.color.grey900;
    }
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
