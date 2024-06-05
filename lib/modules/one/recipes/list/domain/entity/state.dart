// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../value_objects/recipes_resp.dart';

sealed class RecipesState {}

class RecipesIdle extends RecipesState {}

class RecipesLoading extends RecipesState {}

class RecipesData extends RecipesState with EquatableMixin {
  RecipesData(
    this.data, {
    this.isLoading = false,
    this.error,
  });

  final RecipesResp data;
  final Object? error;
  final bool isLoading;

  @override
  List<Object?> get props => [data, isLoading, error];

  bool get hasError => error != null;

  RecipesData copyWith({
    RecipesResp? data,
    bool? isLoading,
    Object? error,
  }) {
    return RecipesData(
      data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class RecipesError extends RecipesState with EquatableMixin {
  RecipesError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
