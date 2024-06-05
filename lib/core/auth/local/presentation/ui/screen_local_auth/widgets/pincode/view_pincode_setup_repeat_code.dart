import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../l10n/generated/l10n.dart';
import '../../../../../../../l10n/l10n_helper.dart';
import '../../../../../../../theme/domain/interface/i_theme.dart';
import '../../../../controller/local_auth_controller.dart';
import '../../widgets/local_auth_view_app_bar.dart';
import 'widgets/cubit/cubit_view_pincode.dart';
import 'widgets/pin_pad_widget/pin_pad_widget.dart';

class ViewPincodeSetupRepeatCode extends StatelessWidget {
  const ViewPincodeSetupRepeatCode({required this.state, super.key});

  final LocalAuthVmPinSetupRepeatCode state;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitViewPinCode(
        pin: state.dto.pin,
        errorMessage: S.current.pinDoesntMatch,
        timeoutErrorMessage: S.current.pincodeErrorTimeout,
      ),
      child: BlocListener<CubitViewPinCode, StateCubitViewPinCode>(
        child: Column(
          children: [
            const SizedBox(height: 5),
            LocalAuthViewAppBar(
              onPop: () {
                context.read<LocalAuthController>().pinSetupSetCode(state.dto);
              },
              onCancel: state.dto.canPop
                  ? () {
                      context.read<LocalAuthController>().unverified();
                    }
                  : null,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    context.s.enterPincodeAgain,
                    style: context.text.hs24w700,
                  ),
                ),
              ],
            ),
            Expanded(
              child: PinPadWidget(
                state: state,
                isVisibleLeftButton: false,
              ),
            ),
          ],
        ),
        listener: (context, stateVmodel) async {
          if (stateVmodel.errorMessage == null && stateVmodel.isPinReady) {
            final cubit = context.read<LocalAuthController>();
            await Future.delayed(
              const Duration(milliseconds: 100),
            );
            cubit.pinSetupComplete(
              state.dto.copyWith(
                pin: stateVmodel.pin.values.join(),
              ),
            );
          }
        },
      ),
    );
  }
}
