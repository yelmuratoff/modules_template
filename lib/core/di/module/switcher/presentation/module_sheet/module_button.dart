import 'package:flutter/material.dart';

import '../../../../../../_shared/assets.gen.dart';
import '../../../../../l10n/l10n_helper.dart';
import '../../../../../theme/domain/interface/i_theme.dart';
import '../../domain/value_objects/app_module.dart';
import 'module_sheet.dart';

class ModuleButton extends StatelessWidget {
  const ModuleButton({
    required this.module,
    super.key,
  });

  final AppModule module;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: context.s.mainMenuHint,
      button: true,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => showModuleSheet(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.color.grey100,
            shape: BoxShape.circle,
          ),
          child: Assets.shared.icons.menu.svg(),
        ),
      ),
    );
  }
}
