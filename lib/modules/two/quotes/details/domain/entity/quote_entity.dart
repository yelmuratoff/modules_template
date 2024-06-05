import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/utils/throw_if_needed.dart';
import '../interface/i_quote_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class QuoteEntity extends Bloc<EventQuote, QuoteState> {
  QuoteEntity({required this.remote}) : super(QuoteIdle()) {
    on<ReadQuote>(_read);
  }

  final IQuoteRepo remote;

  Future<void> _read(
    ReadQuote event,
    Emitter<QuoteState> emit,
  ) async {
    try {
      emit(QuoteLoading());
      final data = await remote.read(event.id);
      emit(
        QuoteData(data),
      );
    } catch (error, stack) {
      emit(
        QuoteError(error),
      );
      throwIfNeeded(error, stack);
    }
  }
}
