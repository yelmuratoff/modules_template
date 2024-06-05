import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/_shared/utils/throw_if_needed.dart';
import '../interface/i_recipe_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class RecipeEntity extends Bloc<EventRecipe, RecipeState> {
  RecipeEntity({required this.remote}) : super(RecipeIdle()) {
    on<ReadRecipe>(_read);
  }

  final IRecipeRepo remote;

  Future<void> _read(
    ReadRecipe event,
    Emitter<RecipeState> emit,
  ) async {
    emit(RecipeLoading());
    try {
      final data = await remote.read(event.id);
      emit(
        RecipeData(data),
      );
    } catch (error, stack) {
      emit(
        RecipeError(error),
      );
      throwIfNeeded(error, stack);
    }
  }
}
