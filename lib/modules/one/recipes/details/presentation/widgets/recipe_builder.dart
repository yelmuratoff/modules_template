import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../_shared/widgets/app_error_widget.dart';
import '../../../../../../_shared/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../../../di.dart';
import '../../../../backend/one_backend.dart';
import '../../data/repo/recipe_repo.dart';
import '../../domain/entity/recipe_entity.dart';

class RecipeBuilder extends StatelessWidget {
  const RecipeBuilder({
    required this.builder,
    required this.id,
    super.key,
  });
  final num id;

  final Widget Function(RecipeData state) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeEntity(
        remote: RecipeRepo(
          appDi.current.get<OneBackend>().gateway,
        ),
      )..add(ReadRecipe(id)),
      child: BlocBuilder<RecipeEntity, RecipeState>(
        builder: (context, state) {
          return switch (state) {
            RecipeIdle _ => const SizedBox.shrink(),
            RecipeLoading _ => const AppProgressIndicator(),
            final RecipeError state => AppErrorWidget(
                error: state.error,
                onRetry: () {
                  context.read<RecipeEntity>().add(
                        ReadRecipe(id),
                      );
                },
              ),
            final RecipeData state => builder(state),
          };
        },
      ),
    );
  }
}
