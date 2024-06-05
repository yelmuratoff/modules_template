import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/utils/throw_if_needed.dart';
import '../interface/i_quotes_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class QuotesEntity extends Bloc<EventQuotes, QuotesState> {
  QuotesEntity({required this.remote}) : super(QuotesIdle()) {
    on<ReadQuotes>(_read, transformer: droppable());
    on<NextPageOfQuotes>(_nextPage, transformer: droppable());
  }

  final pageSize = 10;
  final IQuotesRepo remote;

  Future<void> _read(
    ReadQuotes event,
    Emitter<QuotesState> emit,
  ) async {
    emit(QuotesLoading());
    try {
      final resp = await remote.read(
        QuotesReq(
          page: 1,
          pageSize: pageSize,
        ),
      );
      emit(
        QuotesData(resp),
      );
    } catch (error, stack) {
      emit(
        QuotesError(error),
      );
      throwIfNeeded(error, stack);
    }
  }

  Future<void> _nextPage(
    NextPageOfQuotes event,
    Emitter<QuotesState> emit,
  ) async {
    if (state is! QuotesData) return;
    final current = state as QuotesData;
    if (current.data.currentPage == current.data.totalPages) return;
    emit(
      current.copyWith(isLoading: true),
    );

    try {
      final resp = await remote.read(
        QuotesReq(
          page: current.data.currentPage + 1,
          pageSize: pageSize,
        ),
      );
      emit(
        QuotesData(
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
