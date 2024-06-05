import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../text_fields/app_textfield/app_textfield.dart';

class CounterTextfield extends AppTextfield {
  CounterTextfield({
    super.key,
    CounterTextfieldData? data,
  }) : super(
          data: data ?? CounterTextfieldData(),
        );
}

class CounterTextfieldData extends AppTextfieldData {
  CounterTextfieldData({
    super.visibleErrors = false,
    num? initial,
    super.onChanged,
    super.nextFocus,
    super.enabled = true,
    super.onSubmit,
    super.hintText,
    super.style,
    super.debounce,
    super.maxLength,
    super.suffixText,
  }) : super(
          initial: (initial ?? 0) > 0 ? initial.toString() : '1',
          inputFormatters: [
            /// Only numbers greater than 0
            FilteringTextInputFormatter.allow(
              RegExp(r'^[1-9][0-9]*$'),
            ),
          ],
          padding: const EdgeInsets.all(5),
          textAlign: TextAlign.center,
          keyboardType: Platform.isIOS
              ? const TextInputType.numberWithOptions(
                  signed: true,
                )
              : TextInputType.number,
        );
}
