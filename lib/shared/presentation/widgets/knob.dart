import 'package:flutter/material.dart';

import '../../../core/theme/domain/interface/i_theme.dart';

class Knob extends StatelessWidget {
  const Knob({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: context.color.grey700,
      ),
    );
  }
}
