import 'package:flutter/material.dart';

import '../../../../core/di/module/switcher/domain/value_objects/app_module.dart';
import '../../../../core/di/module/switcher/presentation/module_sheet/module_button.dart';
import '../../../../core/l10n/l10n_helper.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import 'widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.color.grey100,
        title: const MainHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                context.s.main,
                style: context.text.s16w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
