import 'package:flutter/material.dart';

import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../shared/presentation/widgets/app_bar/app_app_bar.dart';
import '../../../../../core/router/navigator1_helper.dart';
import '../../details/presentation/quote_screen.dart';
import 'widgets/quotes_builder.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        canPop: false,
        title: L10n.current.quotes,
      ),
      body: QuotesBuilder(
        builder: (state) {
          return ListView.builder(
            itemCount: state.data.list?.length,
            itemBuilder: (context, index) {
              final item = state.data.list![index];
              return ListTile(
                title: Text(item.quote ?? L10n.current.noData),
                onTap: () {
                  context.router.use.push(
                    QuoteScreen(id: item.id!),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
