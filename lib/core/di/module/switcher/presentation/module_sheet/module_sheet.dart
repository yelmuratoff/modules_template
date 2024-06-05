import 'package:flutter/material.dart';

import '../../../../../../shared/presentation/widgets/knob.dart';
import '../../../../../../shared/presentation/widgets/utils/get_logo_path.dart';
import '../../../../di.dart';
import '../../domain/entity/module_entity.dart';
import '../../../../../theme/domain/interface/i_theme.dart';

Future<void> showModuleSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,

    isScrollControlled: true,
    // useRootNavigator: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
    ),
    builder: (context) {
      final current = appDi.core.get<ModuleEntity>().state.module;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Knob(),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                for (final item in AppModule.values)
                  _Item(
                    module: item,
                    current: current,
                    icon: Image.asset(item.logoPath),
                  ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

class _Item extends StatelessWidget {
  const _Item({
    required this.icon,
    required this.module,
    required this.current,
  });

  final AppModule current;
  final Widget icon;
  final AppModule module;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        appDi.core.get<ModuleEntity>().switchTo(module);
        Navigator.of(context).pop();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              module == current ? context.color.accent.withOpacity(0.1) : null,
        ),
        child: icon,
      ),
    );
  }
}
