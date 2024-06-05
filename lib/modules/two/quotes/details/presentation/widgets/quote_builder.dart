import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/presentation/widgets/app_error_widget.dart';
import '../../../../../../shared/presentation/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../../../core/di/di.dart';
import '../../../../backend/two_backend.dart';
import '../../data/repo/quote_repo.dart';
import '../../domain/entity/quote_entity.dart';

class QuoteBuilder extends StatelessWidget {
  const QuoteBuilder({
    required this.id,
    required this.builder,
    super.key,
  });

  final Widget Function(BuildContext context, QuoteData state) builder;
  final num id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuoteEntity(
        remote: QuoteRepo(
          appDi.current.get<TwoBackend>().gateway,
        ),
      )..add(ReadQuote(id)),
      child: BlocBuilder<QuoteEntity, QuoteState>(
        builder: (context, state) {
          return switch (state) {
            QuoteIdle _ => const SizedBox.shrink(),
            QuoteLoading _ => const AppProgressIndicator(),
            final QuoteError state => AppErrorWidget(
                error: state.error,
                onRetry: () {
                  context.read<QuoteEntity>().add(
                        ReadQuote(id),
                      );
                },
              ),
            final QuoteData state => RefreshIndicator(
                onRefresh: () async {
                  context.read<QuoteEntity>().add(
                        ReadQuote(id),
                      );
                },
                child: builder(context, state),
              ),
          };
        },
      ),
    );
  }
}
