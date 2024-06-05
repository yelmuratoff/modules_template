import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auth/smart_auth.dart';

import '../../../../../core/theme/domain/interface/i_theme.dart';
import '../vmodel.dart';
import 'widgets/digit.dart';

class PincodeWidget extends StatefulWidget {
  const PincodeWidget({super.key, this.length = 6});

  final int length;

  @override
  State<PincodeWidget> createState() => _PincodeWidgetState();
}

class _PincodeWidgetState extends State<PincodeWidget> {
  final _smsService = SmartAuth();

  @override
  void dispose() {
    _smsService.removeSmsListener();
    super.dispose();
  }

  @override
  void initState() {
    _listenForCode();
    super.initState();
  }

  void _listenForCode() {
    _smsService
        .getSmsCode(
      senderPhoneNumber: '1414',
      useUserConsentApi: true,
    )
        .then(
      (response) {
        if (response.succeed == false) return;
        if (response.code?.isEmpty ?? true) return;
        context.read<SmsVerificationVmodel>().replaceDigits(
              response.code!,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<SmsVerificationVmodel, StateCubitViewPinCode>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: PincodeDigit(
                      size: Size(width * 0.1, width * 0.12),
                      value: state.pin[index],
                      isInvalid: state.errorMessage != null,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: (state.errorMessage?.isEmpty ?? true)
                  ? const SizedBox(
                      width: double.maxFinite,
                      height: 1,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Text(
                        state.errorMessage!,
                        style: context.text.s14w400.copyWith(
                          color: context.color.error,
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
