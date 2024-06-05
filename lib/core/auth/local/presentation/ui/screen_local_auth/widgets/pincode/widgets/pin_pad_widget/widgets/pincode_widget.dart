import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../../theme/domain/interface/i_theme.dart';
import '../../cubit/cubit_view_pincode.dart';
import 'dot.dart';

class PincodeWidget extends StatelessWidget {
  const PincodeWidget({super.key, this.length = 4});

  final int length;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitViewPinCode, StateCubitViewPinCode>(
      builder: (context, state) {
        final colors = context.color;
        return Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 30),
                child: PincodeDot(
                  size: const Size(10, 10),
                  value: state.pin[index],
                  isInvalid: state.errorMessage != null,
                  activeColor: colors.accent,
                  inactiveColor: colors.grey700,
                  errorColor: colors.error,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
