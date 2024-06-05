import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/utils/extensions/object_to_error.dart';
import '../../../../../../shared/presentation/widgets/app_error_widget.dart';
import '../../../../../../shared/presentation/widgets/banners/show_banner.dart';
import '../../../../../../shared/presentation/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../shared/presentation/widgets/pagination/app_paginator.dart';
import '../../domain/entity/recipes_entity.dart';

class RecipesBuilder extends StatelessWidget {
  const RecipesBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(RecipesData state) builder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesEntity, RecipesState>(
      bloc: appDi.current.get<RecipesEntity>(),
      builder: (context, state) {
        return switch (state) {
          RecipesIdle _ => const SizedBox.shrink(),
          RecipesLoading _ => const AppProgressIndicator(),
          final RecipesError state => AppErrorWidget(
              error: state.error,
              onRetry: () {
                appDi.current.get<RecipesEntity>().add(
                      ReadRecipes(),
                    );
              },
            ),
          final RecipesData state => AppPaginator(
              isLoading: state.isLoading,
              margin: 50,
              onRefresh: () {
                appDi.current.get<RecipesEntity>().add(
                      ReadRecipes(),
                    );
              },
              onNextPage: () {
                appDi.current.get<RecipesEntity>().add(
                      NextPageOfRecipes(),
                    );
              },
              child: builder(state),
            ),
        };
      },
      listener: (context, state) {
        ShowBanner.hide();
        if (state is RecipesData && state.hasError) {
          ShowBanner.error(
            message: state.error!.toErrorMessage(),
            seconds: 3,
          );
        }
      },
    );
  }
}
