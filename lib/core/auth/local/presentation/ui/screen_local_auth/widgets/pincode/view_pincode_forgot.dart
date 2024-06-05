import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../di/di.dart';
import '../../../../../../../l10n/generated/l10n.dart';
import '../../../../../../../theme/domain/interface/i_theme.dart';
import '../../../../../../remote/_shared/domain/sign_out_entity/sign_out_entity.dart';
import '../../../../controller/local_auth_controller.dart';
import '../../widgets/local_auth_view_app_bar.dart';

class ViewPincodeForgot extends StatelessWidget {
  const ViewPincodeForgot({
    required this.state,
    super.key,
  });

  final LocalAuthVmPinForgot state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        LocalAuthViewAppBar(
          onPop: () {
            context.read<LocalAuthController>().pinVerification(state.dto);
          },
          onCancel: state.dto.canPop
              ? () {
                  context.read<LocalAuthController>().unverified();
                }
              : null,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      L10n.current.forgotPinHint,
                      textAlign: TextAlign.center,
                      style: context.text.hs16w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      L10n.current.signoutOfAccount,
                      textAlign: TextAlign.center,
                      style: context.text.hs16w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: context.button.elevated2,
                      child: Text(L10n.current.signout),
                      onPressed: () async {
                        context.read<LocalAuthController>().unverified();
                        appDi.core.get<SignOutEntity>().add(
                              RequestSignOut(),
                            );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
