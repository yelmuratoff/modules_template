import 'package:flutter/material.dart';

import '../../../shared/assets.gen.dart';
import '../../../shared/presentation/widgets/divider.dart';
import '../../../shared/presentation/widgets/knob.dart';
import '../../di/di.dart';
import '../../l10n/generated/l10n.dart';
import '../../theme/domain/interface/i_theme.dart';
import '../domain/entity/theme_entity.dart';

Future<String?> showThemeSheet(BuildContext context, String currentId) async {
  return showModalBottomSheet<String?>(
    context: context,
    backgroundColor: context.color.background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Knob(),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: Text(
                    L10n.current.appTheme,
                    style: context.text.s20w700,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: CircleAvatar(
                    backgroundColor: context.color.grey100,
                    child: Assets.shared.icons.close.svg(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            ListView.separated(
              shrinkWrap: true,
              itemCount: appDi.current.get<ThemeEntity>().themes.length,
              itemBuilder: (context, index) {
                final id = appDi.current.get<ThemeEntity>().themes[index].id;
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pop(id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(id),
                        ),
                        if (id == currentId)
                          Assets.shared.icons.check.svg(
                            colorFilter: ColorFilter.mode(
                              context.color.accent,
                              BlendMode.srcIn,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, _) => const AppDivider(),
            ),
          ],
        ),
      );
    },
  );
}
