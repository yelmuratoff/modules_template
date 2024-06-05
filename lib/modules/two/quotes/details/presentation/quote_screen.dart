import 'package:flutter/material.dart';

import '../../../../../_shared/widgets/app_bar/app_app_bar.dart';
import '../../../../../core/l10n/l10n_helper.dart';
import '../../../../../core/theme/domain/interface/i_theme.dart';
import 'widgets/quote_builder.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({
    required this.id,
    super.key,
  });

  final num id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: 'Quote',
      ),
      body: QuoteBuilder(
        id: id,
        builder: (context, state) {
          final item = state.data;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                item.quote ?? context.s.noData,
                style: context.text.s16w400,
              ),
              const SizedBox(height: 16),
              Text(
                item.author ?? context.s.noData,
                style: context.text.s16w700,
              ),
            ],
          );
        },
      ),
    );
  }
}
