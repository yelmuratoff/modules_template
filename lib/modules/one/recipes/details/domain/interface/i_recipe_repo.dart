import '../../../_shared/domain/value_objects/recipe.dart';

export '../../../_shared/domain/value_objects/recipe.dart';

abstract class IRecipeRepo {
  Future<Recipe> read(num id);
}
