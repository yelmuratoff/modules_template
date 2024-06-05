import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../shared/assets.gen.dart';
import '../../../../../../../l10n/generated/l10n.dart';
import '../../../../../../../theme/domain/interface/i_theme.dart';
import '../../../../../domain/entity/extensions.dart';
import '../../../../../domain/value_objects/biometrics_type.dart';
import '../../../../controller/local_auth_controller.dart';
import '../local_auth_view_app_bar.dart';

class ViewBiometricsVerification extends StatelessWidget {
  const ViewBiometricsVerification({
    required this.state,
    super.key,
  });

  final LocalAuthVmBiometricsVerification state;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final type =
        context.read<LocalAuthController>().availableBiometrics?.current;
    return Column(
      children: [
        const SizedBox(height: 5),
        if (state.dto.canPop)
          LocalAuthViewAppBar(
            onCancel: () {
              context.read<LocalAuthController>().unverified();
            },
          ),
        const Spacer(),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  switch (type) {
                    BiometricsType.faceId => Assets.shared.icons.faceid.path,
                    _ => Assets.shared.icons.fingerprint.path,
                  },
                  width: 60,
                  colorFilter: ColorFilter.mode(
                    context.color.accent,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.04),
            if (state.dto.errorMessage?.isNotEmpty ?? false)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                      ),
                      child: Text(
                        state.dto.errorMessage!,
                        style: context.text.error,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: height * 0.04),
            if (state.dto.errorMessage != null)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: context.button.elevated1,
                        child: Text(L10n.current.tryAgain),
                        onPressed: () {
                          context
                              .read<LocalAuthController>()
                              .biometricsVerification(
                                state.dto,
                              );
                        },
                      ),
                    ],
                  ),
                  if (state.dto.isVisibleButtonSwitchToPinOnBiometricsError &&
                      context.read<LocalAuthController>().entity.state.pin !=
                          null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: context.button.text1,
                            child: Text(L10n.current.enterPincode),
                            onPressed: () {
                              context
                                  .read<LocalAuthController>()
                                  .pinVerification(
                                    state.dto,
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
