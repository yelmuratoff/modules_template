import 'package:flutter/material.dart';

import '../../../../../../l10n/l10n_helper.dart';
import '../../../../../../theme/domain/interface/i_theme.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              color: context.color.grey300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              context.s.or.toLowerCase(),
              style: context.text.s12w700.copyWith(
                color: context.color.grey900,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              color: context.color.grey300,
            ),
          ),
        ],
      ),
    );
  }
}
