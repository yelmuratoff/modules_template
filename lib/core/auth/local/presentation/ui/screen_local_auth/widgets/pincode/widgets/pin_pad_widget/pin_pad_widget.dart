import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../../_shared/assets.gen.dart';
import '../../../../../../../../../../_shared/widgets/sms_verification/widgets/keypad/keypad.dart';
import '../../../../../../../../../../_shared/widgets/sms_verification/widgets/keypad/keypad_button.dart';
import '../../../../../../../../../../di.dart';
import '../../../../../../../../../l10n/l10n_helper.dart';
import '../../../../../../../../../theme/domain/interface/i_theme.dart';
import '../../../../../../../domain/entity/local_auth_entity.dart';
import '../../../../../../controller/local_auth_controller.dart';
import '../cubit/cubit_view_pincode.dart';
import 'widgets/pincode_widget.dart';

class PinPadWidget extends StatelessWidget {
  const PinPadWidget({
    required this.state,
    super.key,
    this.isVisibleLeftButton = true,
  });

  final bool isVisibleLeftButton;
  final LocalAuthVmState state;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: height * 0.06),
        const PincodeWidget(),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    if (!state.dto.canPop)
                      Padding(
                        padding: EdgeInsets.only(
                          top: height * 0.035,
                        ),
                        child: TextButton(
                          style: context.button.text1,
                          child: Text(
                            context.s.forgotPin,
                          ),
                          onPressed: () {
                            context.read<LocalAuthController>().pinForgot(state.dto);
                          },
                        ),
                      ),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 45,
                      right: 45,
                      bottom: 10,
                    ),
                    child: Center(
                      child: Builder(
                        builder: (context) {
                          final repo = appDi.core.get<LocalAuthEntity>();
                          final isBiometricsOn = repo.state.isBiometricsOn ?? false;
                          return Keypad(
                            onAddDigit: (digit) {
                              context.read<CubitViewPinCode>().addDigit(digit);
                            },
                            onRemoveDigit: () {
                              context.read<CubitViewPinCode>().removeDigit();
                            },
                            leftButton: isBiometricsOn && isVisibleLeftButton
                                ? KeypadButton(
                                    aspectRatio: 1.5,
                                    icon: Assets.shared.icons.fingerprint.svg(
                                      width: 25,
                                      height: 25,
                                      colorFilter: ColorFilter.mode(
                                        context.color.grey900,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: context.color.grey300,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(10),
                                    onPressed: (context) {
                                      context.read<LocalAuthController>().biometricsVerification(
                                            state.dto.copyWith(),
                                          );
                                    },
                                  )
                                : null,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
