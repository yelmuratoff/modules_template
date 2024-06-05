import 'package:equatable/equatable.dart';

import '../../../_shared/domain/value_objects/quote.dart';

sealed class QuoteState {}

class QuoteIdle extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteData extends QuoteState with EquatableMixin {
  QuoteData(this.data);

  final Quote data;

  @override
  List<Object> get props => [data];
}

class QuoteError extends QuoteState with EquatableMixin {
  QuoteError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
