import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pincode_widget/pincode_widget.dart';
import 'request_repeat_timeout.dart';
import 'vmodel.dart';

class SmsVerificationBody extends StatelessWidget {
  const SmsVerificationBody({
    required this.onRepeatSmsRequest,
    required this.isPop,
    super.key,
    this.timeout,
    this.length = 6,
  });

  final bool isPop;
  final VoidCallback onRepeatSmsRequest;
  final DateTime? timeout;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            PincodeWidget(
              length: length,
            ),
            Positioned.fill(
              child: Opacity(
                opacity: 0,
                child: TextField(
                  showCursor: false,
                  maxLength: context.read<SmsVerificationVmodel>().correctCode?.length,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autofocus: true,
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    context.read<SmsVerificationVmodel>().replaceDigits(value);
                  },
                ),
              ),
            ),
          ],
        ),
        Center(
          child: RequestRepeatTimeout(
            timeout: timeout,
            canPop: isPop,
            onTap: onRepeatSmsRequest,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
