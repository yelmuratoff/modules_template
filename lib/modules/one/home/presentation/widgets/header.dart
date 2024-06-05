import 'package:flutter/material.dart';

import '../../../../../core/di/module/switcher/domain/value_objects/app_module.dart';
import '../../../../../core/di/module/switcher/presentation/module_sheet/module_button.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 29,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 14),
            child: const ModuleButton(
              module: AppModule.one,
            ),
          ),
        ),
      ],
    );
  }
}
