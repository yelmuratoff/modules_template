import 'package:flutter/services.dart';

import '../../../utils/extensions/string.dart';
import '../../../../core/l10n/generated/l10n.dart';
import 'app_textfield/app_textfield.dart';
import 'input_formatters/separate_thousands_formatter.dart';

class MoneyTextField extends AppTextfield {
  MoneyTextField({
    super.key,
    MoneyTextfieldData? data,
  }) : super(
          data: data ?? MoneyTextfieldData(),
        );
}

class MoneyTextfieldData extends AppTextfieldData {
  MoneyTextfieldData({
    super.visibleErrors = true,
    String? initial,
    super.onChanged,
    super.nextFocus,
    super.enabled = true,
    super.onSubmit,
    super.hintText,
    super.style,
    super.debounce,
    super.maxLength,
    super.keyboardType = TextInputType.phone,
    bool isMaskApplied = true,
    super.suffixText,
    List<String> Function(String?)? validator,
    super.textAlign,
  }) : super(
          initial: initial?.formatAsCurrency(),
          inputFormatters: isMaskApplied
              ? [
                  FilteringTextInputFormatter.allow(
                    RegExp('[0-9]'),
                  ),
                  SeparateThousandsFormatter(),
                ]
              : null,
          validator: validator ??
              (value) {
                final output = <String>[];
                if (value.isEmpty) {
                  output.add(L10n.current.checkData);
                }
                return output;
              },
        );
}
