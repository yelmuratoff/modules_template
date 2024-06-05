import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../l10n/generated/l10n.dart';
import '../../../../../../../theme/domain/interface/i_theme.dart';
import '../../../../controller/local_auth_controller.dart';
import '../../widgets/local_auth_view_app_bar.dart';
import 'widgets/cubit/cubit_view_pincode.dart';
import 'widgets/pin_pad_widget/pin_pad_widget.dart';

class ViewPincodeSetupSetCode extends StatelessWidget {
  const ViewPincodeSetupSetCode({
    required this.state,
    super.key,
  });

  final LocalAuthVmPinSetupSetCode state;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => CubitViewPinCode(
        timeoutErrorMessage: L10n.current.pincodeErrorTimeout,
      ),
      child: BlocListener<CubitViewPinCode, StateCubitViewPinCode>(
        child: Column(
          children: [
            const SizedBox(height: 5),
            LocalAuthViewAppBar(
              onPop: state.dto.skipAsk
                  ? null
                  : () {
                      context.read<LocalAuthController>().setup(state.dto);
                    },
              onCancel: state.dto.canPop
                  ? () {
                      context.read<LocalAuthController>().unverified();
                    }
                  : null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      20,
                      height * 0.03,
                      20,
                      height * 0.05,
                    ),
                    child: Text(
                      L10n.current.setFastAccessCode,
                      style: context.text.hs24w700,
                      textAlign: TextAlign.center,
                    ),
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
            cubit.pinSetupRepeatCode(
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
