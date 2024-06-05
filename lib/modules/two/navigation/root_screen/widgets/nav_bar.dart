import 'package:flutter/material.dart';

import '../../../../../../core/l10n/l10n_helper.dart';
import '../../../../../_shared/assets.gen.dart';
import '../../../../../_shared/widgets/nav_bar_item.dart';
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
          label: context.s.main,
          selectedColor: context.color.accent,
        ),
        NavBarItem(
          icon: Assets.two.icons.screen2,
          label: 'Screen 2',
          selectedColor: context.color.accent,
        ),
        NavBarItem(
          icon: Assets.two.icons.profile,
          label: context.s.profile,
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