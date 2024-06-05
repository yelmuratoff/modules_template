import 'package:flutter/material.dart';

import '../../../_shared/assets.gen.dart';
import '../../../_shared/widgets/divider.dart';
import '../../../_shared/widgets/knob.dart';
import '../../../di.dart';
import '../../theme/domain/interface/i_theme.dart';
import '../domain/entity/locale_entity.dart';
import '../domain/value_objects/app_locale.dart';
import '../l10n_helper.dart';
import 'utils/locale_name.dart';

Future<AppLocale?> showLangSheet(BuildContext context, AppLocale currentLocale) async {
  return showModalBottomSheet<AppLocale?>(
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
                    context.s.interfaceLang,
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
              itemCount: appDi.core.get<LocaleEntity>().supportedLocales.length,
              itemBuilder: (context, index) {
                final item = appDi.core.get<LocaleEntity>().supportedLocales[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pop(item);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.localizedName,
                          ),
                        ),
                        if (item == currentLocale)
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
