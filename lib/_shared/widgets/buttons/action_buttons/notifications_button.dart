import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n_helper.dart';

class NotificationsButton extends StatelessWidget {
  const NotificationsButton({
    required this.icon,
    required this.onTap,
    this.color,
    super.key,
  });

  final Color? color;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: context.s.navigateToNotificationsScreen,
      button: true,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
      ),
    );
  }
}
