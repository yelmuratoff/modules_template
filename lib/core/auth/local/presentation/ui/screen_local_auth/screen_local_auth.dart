import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../theme/domain/interface/i_theme.dart';
import '../../controller/local_auth_controller.dart';
import 'widgets/biometrics/view_biometrics_ask.dart';
import 'widgets/biometrics/view_biometrics_setup.dart';
import 'widgets/biometrics/view_biometrics_verification.dart';
import 'widgets/pincode/view_pincode_forgot.dart';
import 'widgets/pincode/view_pincode_setup_ask.dart';
import 'widgets/pincode/view_pincode_setup_repeat_code.dart';
import 'widgets/pincode/view_pincode_setup_set_code.dart';
import 'widgets/pincode/view_pincode_verification.dart';

class ScreenLocalAuth extends StatefulWidget {
  const ScreenLocalAuth({
    required this.cubit,
    super.key,
  });

  final LocalAuthController cubit;

  @override
  State<ScreenLocalAuth> createState() => _ScreenLocalAuthState();
}

class _ScreenLocalAuthState extends State<ScreenLocalAuth> {
  @override
  void dispose() {
    BackButtonInterceptor.remove(popInterceptor);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(popInterceptor);
  }

  bool popInterceptor(_, __) => true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: ColoredBox(
        color: context.color.background,
        child: SafeArea(
          child: SizedBox.expand(
            child: BlocBuilder<LocalAuthController, LocalAuthVmState>(
              builder: (context, state) {
                if (state is LocalAuthVmPinVerification) {
                  return ViewPincodeVerification(state: state);
                }
                if (state is LocalAuthVmPinSetupAsk) {
                  return ViewPincodeSetupAsk(state: state);
                }
                if (state is LocalAuthVmPinSetupSetCode) {
                  return ViewPincodeSetupSetCode(state: state);
                }
                if (state is LocalAuthVmPinSetupRepeatCode) {
                  return ViewPincodeSetupRepeatCode(state: state);
                }
                if (state is LocalAuthVmBiometricsSetup) {
                  if (state.dto.skipAsk) {
                    return ViewBiometricsSetup(state: state);
                  } else {
                    return ViewBiometricsSetupAsk(state: state);
                  }
                }
                if (state is LocalAuthVmBiometricsVerification) {
                  return ViewBiometricsVerification(state: state);
                }
                if (state is LocalAuthVmPinForgot) {
                  return ViewPincodeForgot(state: state);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
