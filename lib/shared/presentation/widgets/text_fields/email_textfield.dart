import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart';

import '../../../../core/l10n/generated/l10n.dart';
import '../../../assets.gen.dart';
import 'app_textfield/app_textfield.dart';

class EmailTextfield extends AppTextfield {
  EmailTextfield({
    super.key,
    EmailTextfieldData? data,
  }) : super(
          data: data ?? EmailTextfieldData(),
        );
}

class EmailTextfieldData extends AppTextfieldData {
  EmailTextfieldData({
    super.enabled,
    super.initial,
    super.nextFocus,
    super.style,
    super.debounce,
    super.onChanged,
    super.onFocusLost,
    super.maxLength,
    super.autofocus = false,
    super.onSubmit,
    super.keyboardType = TextInputType.emailAddress,
    String? hintText,
    bool isValidatorEnabled = true,
    super.validateOnInit,
    List<String> Function(String?)? validator,
  }) : super(
          textCapitalization: TextCapitalization.none,
          hintText: hintText ?? L10n.current.email,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp('[а-яА-Я]'),
            ),
          ],
          validator: validator ??
              (value) {
                if (!isValidatorEnabled) return <String>[];
                return defaultValidator(value);
              },
          prefixIcon: (color) => Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Assets.shared.icons.email.svg(
              colorFilter: color == null
                  ? null
                  : ColorFilter.mode(
                      color,
                      BlendMode.srcIn,
                    ),
            ),
          ),
        );

  static List<String> defaultValidator(String? value) {
    final output = <String>[];
    if (value?.isEmpty ?? true) {
      output.add(L10n.current.inputErrorEmailIsEmpty);
      return output;
    }
    if (!isEmail(value!)) {
      output.add(L10n.current.inputErrorEmailIncorrect);
    }
    return output;
  }
}
