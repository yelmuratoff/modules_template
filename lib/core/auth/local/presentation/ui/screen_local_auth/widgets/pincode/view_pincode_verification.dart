// ignore_for_file: unnecessary_null_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../l10n/generated/l10n.dart';
import '../../../../../../../theme/domain/interface/i_theme.dart';
import '../../../../controller/local_auth_controller.dart';
import '../../widgets/local_auth_view_app_bar.dart';
import 'widgets/cubit/cubit_view_pincode.dart';
import 'widgets/pin_pad_widget/pin_pad_widget.dart';

class ViewPincodeVerification extends StatelessWidget {
  const ViewPincodeVerification({
    required this.state,
    super.key,
  });

  final LocalAuthVmPinVerification state;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => CubitViewPinCode(
        pin: state.dto.pin!,
        errorMessage: L10n.current.wrongCode,
        timeout: state.dto.timeout,
        timeoutErrorMessage: L10n.current.pincodeErrorTimeout,
      ),
      child: BlocListener<CubitViewPinCode, StateCubitViewPinCode>(
        child: Column(
          children: [
            const SizedBox(height: 5),
            if (state.dto.canPop)
              LocalAuthViewAppBar(
                onCancel: () {
                  context.read<LocalAuthController>().unverified();
                },
              ),
            SizedBox(height: height * 0.03),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    L10n.current.enterFastAccessCode,
                    style: context.text.s14w400.copyWith(
                      color: context.color.grey900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Expanded(
              child: PinPadWidget(state: state),
            ),
          ],
        ),
        listener: (context, stateVmodel) async {
          if (stateVmodel.errorMessage == null && stateVmodel.isPinReady) {
            final cubit = context.read<LocalAuthController>();
            await Future.delayed(
              const Duration(milliseconds: 100),
            );
            cubit.verified();
          }
        },
      ),
    );
  }
}
