import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/utils/throw_if_needed.dart';
import '../interface/i_recipes_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class RecipesEntity extends Bloc<EventRecipes, RecipesState> {
  RecipesEntity({required this.remote}) : super(RecipesIdle()) {
    on<ReadRecipes>(_read);
    on<NextPageOfRecipes>(_nextPage);
  }

  final pageSize = 10;
  final IRecipesRepo remote;

  Future<void> _read(
    ReadRecipes event,
    Emitter<RecipesState> emit,
  ) async {
    emit(RecipesLoading());
    try {
      final resp = await remote.read(
        RecipesReq(
          page: 1,
          pageSize: pageSize,
        ),
      );
      emit(
        RecipesData(resp),
      );
    } catch (error, stack) {
      emit(
        RecipesError(error),
      );
      throwIfNeeded(error, stack);
    }
  }

  Future<void> _nextPage(
    NextPageOfRecipes event,
    Emitter<RecipesState> emit,
  ) async {
    if (state is! RecipesData) return;
    final current = state as RecipesData;
    if (current.data.currentPage == current.data.totalPages) return;
    emit(
      current.copyWith(isLoading: true),
    );

    try {
      final resp = await remote.read(
        RecipesReq(
          page: current.data.currentPage + 1,
          pageSize: pageSize,
        ),
      );
      emit(
        RecipesData(
          resp.copyWith(
            list: [
              ...current.data.list ?? [],
              ...resp.list ?? [],
            ],
          ),
        ),
      );
    } catch (error, stack) {
      emit(
        current.copyWith(
          isLoading: false,
          error: error,
        ),
      );
      throwIfNeeded(error, stack);
    }
  }
}
