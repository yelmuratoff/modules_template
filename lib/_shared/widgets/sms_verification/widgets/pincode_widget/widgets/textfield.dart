import 'package:flutter/material.dart';

import '../../../../../../core/theme/domain/interface/i_theme.dart';

class PincodeTextfield extends StatelessWidget {
  const PincodeTextfield({
    required this.controller,
    required this.onChanged,
    required this.size,
    super.key,
    this.isInvalid = false,
  });

  final TextEditingController controller;
  final bool isInvalid;
  final void Function(String value) onChanged;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.color.success,
        borderRadius: BorderRadius.circular(4),
      ),
      child: controller.text.isEmpty
          ? Container(
              width: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.color.grey700,
              ),
            )
          : Stack(
              fit: StackFit.expand,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        // showCursor: false,
                        // decoration: const InputDecoration.collapsed(hintText: '*'),
                        style: context.text.s36w400.copyWith(
                          color: isInvalid ? context.color.error : null,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: onChanged,
                      ),
                    ),
                  ],
                ),
                // Center(
                //   child: Container(
                //     width: 6,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: context.color.grey700,
                //     ),
                //   ),
                // ),
              ],
            ),
    );
  }
}
