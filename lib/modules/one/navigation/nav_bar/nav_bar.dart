import 'package:flutter/material.dart';

import '../../../../core/l10n/generated/l10n.dart';
import '../../../../shared/assets.gen.dart';
import '../../../../shared/presentation/widgets/nav_bar_item.dart';
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
          label: L10n.current.main,
          selectedColor: context.color.accent,
        ),
        NavBarItem(
          icon: Assets.one.icons.screen2,
          label: L10n.current.receipes,
          selectedColor: context.color.accent,
        ),
        NavBarItem(
          icon: Assets.one.icons.screen3,
          label: L10n.current.products,
          selectedColor: context.color.accent,
        ),
        NavBarItem(
          icon: Assets.one.icons.profile,
          label: L10n.current.profile,
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
