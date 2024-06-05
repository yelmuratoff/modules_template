import 'package:equatable/equatable.dart';

import '../../../_shared/domain/value_objects/recipe.dart';

sealed class RecipeState {}

class RecipeIdle extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeData extends RecipeState with EquatableMixin {
  RecipeData(this.item);

  final Recipe item;

  @override
  List<Object> get props => [item];
}

class RecipeError extends RecipeState with EquatableMixin {
  RecipeError(this.error);

  final Object error;
  @override
  List<Object> get props => [error];
}
