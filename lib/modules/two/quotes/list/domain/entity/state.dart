import 'package:equatable/equatable.dart';

import '../value_objects/quotes_resp.dart';

sealed class QuotesState {}

class QuotesIdle extends QuotesState {}

class QuotesLoading extends QuotesState {}

class QuotesData extends QuotesState with EquatableMixin {
  QuotesData(
    this.data, {
    this.isLoading = false,
    this.error,
  });

  final QuotesResp data;
  final Object? error;
  final bool isLoading;

  @override
  List<Object?> get props => [data, isLoading, error];

  bool get hasError => error != null;

  QuotesData copyWith({
    QuotesResp? data,
    bool? isLoading,
    Object? error,
  }) {
    return QuotesData(
      data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class QuotesError extends QuotesState with EquatableMixin {
  QuotesError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
