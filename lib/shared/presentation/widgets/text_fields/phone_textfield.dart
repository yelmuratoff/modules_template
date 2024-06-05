import 'package:flutter/material.dart';

import '../../../utils/extensions/string.dart';
import '../../../../core/l10n/generated/l10n.dart';
import 'app_textfield/app_textfield.dart';
import 'input_formatters/custom_phone_input_formatter.dart';

class PhoneTextfield extends AppTextfield {
  PhoneTextfield({
    super.key,
    PhoneTextfieldData? data,
  }) : super(
          data: data ?? PhoneTextfieldData(),
        );
}

class PhoneTextfieldData extends AppTextfieldData {
  PhoneTextfieldData({
    super.onChanged,
    super.onSubmit,
    super.onFocusLost,
    super.visibleErrors = true,
    super.autofocus,
    super.enabled,
    String? initial,
    super.nextFocus,
    super.style,
    super.debounce,
    super.keyboardType = TextInputType.phone,
    String? hintText,
    bool isValidatorEnabled = true,
    bool isMaskApplied = true,
    List<String> Function(String?)? validator,
  }) : super(
          initial: initial?.formatAsPhone ?? '+7',
          hintText: hintText ?? L10n.current.phoneNumber,
          inputFormatters: isMaskApplied ? [CustomPhoneInputFormatter()] : null,
          validator: validator ??
              (value) {
                if (!isValidatorEnabled) return <String>[];
                return defaultValidator(value);
              },
          prefixIcon: (color) => Container(
            margin: const EdgeInsets.only(left: 5),
            padding: const EdgeInsets.all(7),
            child: Icon(
              Icons.phone,
              color: color,
            ),
          ),
        );

  static List<String> defaultValidator(String? value) {
    final output = <String>[];
    final phone = value.extractDigits;
    if (phone == null || phone.isEmpty) {
      output.add(L10n.current.inputErrorPhoneIsEmpty);
    } else if (phone.length != 11) {
      output.add(L10n.current.inputErrorPhoneIncorrect);
    } else if (phone.substring(0, 2) != '77') {
      output.add(L10n.current.inputErrorPhoneIncorrect);
    }
    return output;
  }
}
