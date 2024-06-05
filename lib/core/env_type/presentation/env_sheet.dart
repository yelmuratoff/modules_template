import 'package:flutter/material.dart';

import '../../../_shared/assets.gen.dart';
import '../../../_shared/widgets/bottom_sheets/widgets/bottom_sheet_header.dart';
import '../../../_shared/widgets/divider.dart';
import '../../../_shared/widgets/knob.dart';
import '../../theme/domain/interface/i_theme.dart';
import '../domain/value_objects/env_type.dart';

Future<EnvType?> showEnvSheet(BuildContext context, EnvType current) async {
  return showModalBottomSheet<EnvType?>(
    context: context,
    isDismissible: false,
    backgroundColor: context.color.background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: context.color.background,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Knob(),
            const BottomSheetHeader(
              title: 'Select environment',
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: EnvType.values.length,
              itemBuilder: (context, index) {
                final item = EnvType.values[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pop(
                      item == current ? null : item,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.name,
                          ),
                        ),
                        if (item == current)
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
