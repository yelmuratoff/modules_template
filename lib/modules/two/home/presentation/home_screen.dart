import 'package:flutter/material.dart';

import '../../../../core/theme/domain/interface/i_theme.dart';
import 'widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MainHeader(),
        Expanded(
          child: Center(
            child: Text(
              'Home Screen',
              style: context.text.s16w400,
            ),
          ),
        ),
      ],
    );
  }
}
