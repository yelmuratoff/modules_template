import 'package:flutter/material.dart';

import '../../../assets.gen.dart';

class SignOutBtnIcon extends StatelessWidget {
  const SignOutBtnIcon({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Assets.shared.icons.signout.svg(),
    );
  }
}
