import '../../domain/value_objects/recipe.dart';

extension RecipeConvert on Recipe {
  static Recipe? fromJson(dynamic json) {
    if (json == null) return null;
    return Recipe(
      id: json['id'],
      name: json['name'],
      difficulty: json['difficulty'],
      cookTimeMinutes: json['cookTimeMinutes'],
      caloriesPerServing: json['caloriesPerServing'],
      instructions: List<String>.from(json['instructions']),
      ingredients: List<String>.from(json['ingredients']),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'difficulty': difficulty,
      'cookTimeMinutes': cookTimeMinutes,
      'caloriesPerServing': caloriesPerServing,
      'instructions': instructions,
      'ingredients': ingredients,
    };
  }
}

abstract class RecipeListConvert {
  static List<Recipe>? from(List? list) {
    if (list == null) return null;
    return list
        .map<Recipe?>(RecipeConvert.fromJson)
        .whereType<Recipe>()
        .toList();
  }
}
