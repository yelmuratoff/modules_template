import 'package:flutter/material.dart';

import '../../../../../../../core/theme/domain/interface/i_theme.dart';

class ErrorLine extends StatelessWidget {
  const ErrorLine({
    required this.errorMessage,
    super.key,
  });

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) => SizeTransition(
                    axisAlignment: -1,
                    sizeFactor: animation,
                    child: child,
                  ),
                  layoutBuilder:
                      (Widget? currentChild, List<Widget> previousChildren) {
                    return Column(
                      children: <Widget>[
                        if (currentChild != null) currentChild,
                        ...previousChildren,
                      ],
                    );
                  },
                  child: Center(
                    key: UniqueKey(),
                    child: Text(
                      key: UniqueKey(),
                      errorMessage ?? '',
                      textAlign: TextAlign.center,
                      style: context.text.s14w400.copyWith(
                        color: context.color.error,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
