import 'package:flutter/material.dart';

import '../../../../../../../core/theme/domain/interface/i_theme.dart';

class PincodeDigit extends StatelessWidget {
  const PincodeDigit({
    required this.size,
    super.key,
    this.value,
    this.isInvalid = false,
  });

  final bool isInvalid;
  final int? value;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.color.background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: value == null
          ? Container(
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.color.grey700,
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: Text(
                    value!.toString(),
                    style: context.text.s36w400.copyWith(
                      color: isInvalid ? context.color.error : null,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
    );
  }
}
