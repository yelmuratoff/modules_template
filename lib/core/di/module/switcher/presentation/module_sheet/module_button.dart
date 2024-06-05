import 'package:flutter/material.dart';

import '../../../../../../shared/assets.gen.dart';
import '../../../../../l10n/generated/l10n.dart';
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
      label: L10n.current.mainMenuHint,
      button: true,
      child: InkWell(
        onTap: () => showModuleSheet(context),
        borderRadius: BorderRadius.circular(100),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.color.grey100,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Assets.shared.icons.menu.svg(),
          ),
        ),
      ),
    );
  }
}
