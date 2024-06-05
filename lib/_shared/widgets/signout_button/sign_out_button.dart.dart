import 'package:flutter/material.dart';

import '../../../core/navigation/navigator1_helper.dart';
import '../banners/show_banner.dart';
import '../dialogs/exit_confirmation.dart';
import 'widgets/sign_out_bn_elevated.dart';
import 'widgets/sign_out_bn_icon.dart';
import 'widgets/sign_out_btn_tile.dart';

enum _SignOutButtonType { action, tile, elevated }

class SignOutButton extends StatelessWidget {
  const SignOutButton.action({
    super.key,
  }) : _type = _SignOutButtonType.action;

  const SignOutButton.elevated({
    super.key,
  }) : _type = _SignOutButtonType.elevated;

  const SignOutButton.tile({
    super.key,
  }) : _type = _SignOutButtonType.tile;

  final _SignOutButtonType _type;

  void _onTap(BuildContext context) {
    ShowBanner.hide();
    FocusScope.of(context).unfocus();
    showExitConfirmation(
      onConfirm: () {
        context.rootRouter.use.pushSignOutScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return switch (_type) {
          _SignOutButtonType.action => SignOutBtnIcon(
              onTap: () => _onTap(context),
            ),
          _SignOutButtonType.elevated => SignOutBtnElevated(
              onTap: () => _onTap(context),
            ),
          _SignOutButtonType.tile => SignOutBtnTile(
              onTap: () => _onTap(context),
            ),
        };
      },
    );
  }
}
