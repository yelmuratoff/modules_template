import 'package:flutter/material.dart';

import '../../../../../core/l10n/generated/l10n.dart';

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
      label: L10n.current.navigateToNotificationsScreen,
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
