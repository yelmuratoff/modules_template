import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  const Recipe({
    required this.id,
    this.name,
    this.difficulty,
    this.cookTimeMinutes,
    this.caloriesPerServing,
    this.image,
    this.instructions = const [],
    this.ingredients = const [],
  });

  final num? caloriesPerServing;
  final num? cookTimeMinutes;
  final String? difficulty;
  final num id;
  final List<String>? ingredients;
  final List<String>? instructions;
  final String? name;
  final String? image;

  @override
  List<Object?> get props {
    return [
      difficulty,
      id,
      instructions,
      ingredients,
      cookTimeMinutes,
      name,
      caloriesPerServing,
      image,
    ];
  }
}
