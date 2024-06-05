import 'package:flutter/material.dart';

import 'widgets/quantifier_button.dart';
import 'widgets/quantity_textfield.dart';

class Quantifier extends StatefulWidget {
  const Quantifier({
    this.initial,
    this.width = 40,
    this.onChanged,
    this.debounce,
    this.debugLabel,
    this.resetOnWidgetUpdateIf,
    super.key,
  });

  final void Function(num)? onChanged;
  final bool Function()? resetOnWidgetUpdateIf;
  final Duration? debounce;
  final String? debugLabel;
  final num? initial;
  final double width;

  @override
  State<Quantifier> createState() => _QuantifierState();
}

class _QuantifierState extends State<Quantifier> {
  late final CounterTextfield field = CounterTextfield(
    data: CounterTextfieldData(
      initial: widget.initial,
      onChanged: (value) {
        widget.onChanged?.call(
          num.tryParse(value) ?? 0,
        );
      },
      debounce: widget.debounce,
    ),
  );

  @override
  void didUpdateWidget(covariant Quantifier oldWidget) {
    super.didUpdateWidget(oldWidget);
    final force = widget.resetOnWidgetUpdateIf?.call() ?? false;
    if (oldWidget.initial == widget.initial && !force) return;
    var newValue = '1';
    if ((widget.initial ?? 0) > 0) {
      newValue = widget.initial.toString();
    }
    field.data.controller.text = newValue;
  }

  @override
  void dispose() {
    field.dispose();
    super.dispose();
  }

  num get current {
    return num.tryParse(field.data.controller.text) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        QuantifierButton(
          enabled: current > 1,
          onPressed: () {
            final current = this.current;
            if (current <= 1) return;

            field.data.controller.text = (current - 1).toString();
            if (current == 2) setState(() {});
          },
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: widget.width,
          child: field,
        ),
        QuantifierButton(
          onPressed: () {
            final current = this.current;
            field.data.controller.text = (current + 1).toString();
            if (current == 1) setState(() {});
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
