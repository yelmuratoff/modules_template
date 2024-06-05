import 'package:equatable/equatable.dart';

import '../../../_shared/domain/value_objects/recipe.dart';

export '../../../_shared/domain/value_objects/recipe.dart';

class RecipesResp extends Equatable {
  const RecipesResp({
    required this.totalPages,
    required this.currentPage,
    required this.pageSize,
    this.list,
  });

  final int currentPage;
  final List<Recipe>? list;
  final int pageSize;
  final int totalPages;

  @override
  List<Object?> get props => [list, totalPages, currentPage, pageSize];

  RecipesResp copyWith({
    List<Recipe>? list,
    int? totalPages,
    int? currentPage,
    int? pageSize,
  }) {
    return RecipesResp(
      list: list ?? this.list,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
    );
  }
}
