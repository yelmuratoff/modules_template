import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/presentation/widgets/app_error_widget.dart';
import '../../../../../../shared/presentation/widgets/banners/show_banner.dart';
import '../../../../../../shared/presentation/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../../../shared/presentation/widgets/pagination/app_paginator.dart';
import '../../../../../../shared/utils/extensions/object_to_error.dart';
import '../../../../../../core/di/di.dart';
import '../../domain/entity/quotes_entity.dart';

class QuotesBuilder extends StatelessWidget {
  const QuotesBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(QuotesData state) builder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuotesEntity, QuotesState>(
      bloc: appDi.current.get<QuotesEntity>(),
      builder: (context, state) {
        return switch (state) {
          QuotesIdle _ => const SizedBox.shrink(),
          QuotesLoading _ => const AppProgressIndicator(),
          final QuotesError state => AppErrorWidget(
              error: state.error,
              onRetry: () {
                appDi.current.get<QuotesEntity>().add(
                      ReadQuotes(),
                    );
              },
            ),
          final QuotesData state => AppPaginator(
              isLoading: state.isLoading,
              margin: 50,
              onRefresh: () {
                appDi.current.get<QuotesEntity>().add(
                      ReadQuotes(),
                    );
              },
              onNextPage: () {
                appDi.current.get<QuotesEntity>().add(
                      NextPageOfQuotes(),
                    );
              },
              child: builder(state),
            ),
        };
      },
      listener: (context, state) {
        ShowBanner.hide();
        if (state is QuotesData && state.hasError) {
          ShowBanner.error(
            message: state.error!.toErrorMessage(),
            seconds: 3,
          );
        }
      },
    );
  }
}
