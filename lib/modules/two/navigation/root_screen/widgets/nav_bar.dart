import 'package:flutter/material.dart';

import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../shared/assets.gen.dart';
import '../../../../../shared/presentation/widgets/nav_bar_item.dart';
import '../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../auth/two_auth.dart';

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
          icon: Assets.two.icons.home,
          label: L10n.current.main,
          selectedColor: context.color.accent,
        ),
        NavBarItem(
          icon: Assets.two.icons.screen2,
          label: L10n.current.quotes,
          selectedColor: context.color.accent,
        ),
        NavBarItem(
          icon: Assets.two.icons.profile,
          label: L10n.current.profile,
          selectedColor: context.color.accent,
        ),
      ],
      onDestinationSelected: (index) async {
        if (index == 1) {
          TwoAuth.verify(
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
