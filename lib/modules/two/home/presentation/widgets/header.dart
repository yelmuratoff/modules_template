import 'package:flutter/material.dart';

import '../../../../../core/di/module/switcher/domain/value_objects/app_module.dart';
import '../../../../../core/di/module/switcher/presentation/module_sheet/module_button.dart';
import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../core/theme/domain/interface/i_theme.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const ModuleButton(module: AppModule.two),
        const SizedBox(width: 16),
        Expanded(
          flex: 40,
          child: Semantics(
            label: L10n.current.appLogo,
            child: Text(
              L10n.current.main,
              style: context.text.s20w700.copyWith(
                color: context.color.grey100,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
