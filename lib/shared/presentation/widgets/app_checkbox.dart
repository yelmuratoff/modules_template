import 'package:flutter/material.dart';

import '../../../core/theme/domain/interface/i_theme.dart';

class AppCheckbox extends StatefulWidget {
  const AppCheckbox({
    super.key,
    this.initial = false,
    this.onChanged,
  });

  final Function(bool?)? onChanged;
  final bool initial;

  @override
  AppCheckboxState createState() => AppCheckboxState();
}

class AppCheckboxState extends State<AppCheckbox> {
  late bool value;

  @override
  void didUpdateWidget(AppCheckbox oldWidget) {
    if (oldWidget.initial != widget.initial) {
      setState(() {
        value = widget.initial;
      });
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  void initState() {
    value = widget.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      side: BorderSide(
        color: context.color.grey700,
      ),
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return context.color.accent;
          }
          return context.color.accent;
        },
      ),
      checkColor: context.color.background,
      value: value,
      onChanged: (value) {
        if (widget.onChanged == null) return;
        widget.onChanged?.call(value);
        setState(() {
          this.value = value ?? false;
        });
      },
    );
  }
}
