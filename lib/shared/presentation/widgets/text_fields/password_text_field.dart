// ignore_for_file: unnecessary_raw_strings

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/l10n/generated/l10n.dart';
import '../../../assets.gen.dart';
import 'app_textfield/app_textfield.dart';

class PasswordTextField extends AppTextfield {
  PasswordTextField({
    super.key,
    PasswordTextfieldData? data,
  }) : super(
          data: data ?? PasswordTextfieldData(),
        );
}

class PasswordTextfieldData extends AppTextfieldData {
  PasswordTextfieldData({
    super.initial,
    super.onChanged,
    super.onSubmit,
    super.onFocusLost,
    super.enabled = true,
    String? hintText,
    super.keyboardType = TextInputType.text,
    super.textCapitalization = TextCapitalization.none,
    super.nextFocus,
    super.isVisibleObscureButton = true,
    super.obscureText = true,
    List<String> Function(String?)? validator,
    super.validateOnInit,
  }) : super(
          hintText: hintText ?? L10n.current.password,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(
                r'[\w]',
              ),
              // RegExp(
              //   r'[\w_\.!\-?$%^&\*()\+|~=`{}\[\]:;"@#<>?,]',
              // ),
            ),
          ],
          validator: validator ??
              (value) {
                final output = <String>[];
                if (value.isEmpty) {
                  output.add(L10n.current.inputErrorPasswordIsEmpty);
                  return output;
                }
                if (value.length < 8) {
                  output.add(L10n.current.inputErrorPasswordIsShort);
                }
                // if (!RegExp(r'[\d]').hasMatch(value)) {
                //   output.add(L10n.current.inputErrorPasswordMustContainDigit);
                // }
                // if (!RegExp(r'[\_\.!\-?$%^&\*()\+|~=`{}\[\]:;"@#<>?,]').hasMatch(value)) {
                //   output.add(L10n.current.inputErrorPasswordMustContainSpecSymbol);
                // }
                return output;
              },
          prefixIcon: (color) => Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Assets.shared.icons.password.svg(
              colorFilter: color == null
                  ? null
                  : ColorFilter.mode(
                      color,
                      BlendMode.srcIn,
                    ),
            ),
          ),
        );
}
