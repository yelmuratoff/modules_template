import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n_helper.dart';
import '../../../../_shared/assets.gen.dart';
import '../../../../_shared/widgets/nav_bar_item.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import '../../auth/one_auth.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    required this.current,
    required this.switchTo,
    super.key,
  });

  final int current;
  final void Function(int) switchTo;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: current,
      destinations: [
        NavBarItem(
          icon: Assets.one.icons.home,
          label: context.s.main,
          selectedColor: context.color.accent,
        ),
        NavBarItem(
          icon: Assets.one.icons.screen2,
          label: context.s.receipes,
          selectedColor: context.color.accent,
        ),
        NavBarItem(
          icon: Assets.one.icons.screen3,
          label: context.s.products,
          selectedColor: context.color.accent,
        ),
        NavBarItem(
          icon: Assets.one.icons.profile,
          label: context.s.profile,
          selectedColor: context.color.accent,
        ),
      ],
      onDestinationSelected: (index) {
        if (index == 2) {
          OneAuth.verify(
            onSuccess: () async {
              switchTo(index);
            },
          );
        } else {
          switchTo(index);
        }
      },
    );
  }
}
