import 'package:flutter/services.dart';

import '../../../../core/_shared/utils/extensions/string.dart';

///degault: maxLength = 30
class SeparateThousandsFormatter extends TextInputFormatter {
  SeparateThousandsFormatter({
    this.decimals = 0,
  });
  final int decimals;
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var output = newValue.text;
    output = newValue.text.formatAsCurrency(
      decimals: decimals,
    );
    final result = TextEditingValue(
      text: output,
      selection: TextSelection.collapsed(
        offset: output.length,
      ),
    );
    return result;
  }
}
