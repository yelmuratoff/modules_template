import 'package:flutter/material.dart';

import '../assets.gen.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    required this.label,
    required this.icon,
    required this.selectedColor,
    super.key,
  });

  final SvgGenImage icon;
  final String label;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: icon.svg(),
      selectedIcon: icon.svg(
        colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
      ),
      label: label,
    );
  }
}
