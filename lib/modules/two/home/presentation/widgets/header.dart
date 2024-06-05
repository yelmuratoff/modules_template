import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n_helper.dart';
import '../../../../../core/di/module/switcher/domain/value_objects/app_module.dart';
import '../../../../../core/di/module/switcher/presentation/module_sheet/module_button.dart';
import '../../../../../core/theme/domain/interface/i_theme.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.0, 0.1],
          colors: [
            context.color.link,
            context.color.accent,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: context.color.shadow,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const ModuleButton(module: AppModule.two),
          Expanded(
            flex: 40,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 2),
              child: Semantics(
                label: context.s.appLogo,
                child: Text(
                  'Screen 1',
                  style: context.text.s20w700.copyWith(
                    color: context.color.grey100,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
