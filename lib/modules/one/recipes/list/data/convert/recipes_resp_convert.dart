import '../../../_shared/data/convert/recipe_convert.dart';
import '../../domain/value_objects/recipes_resp.dart';

abstract class RecipesRespConvert {
  static RecipesResp fromJson(dynamic json, int pageSize) {
    int totalPages = json['total'] ~/ pageSize;
    if (json['total'] % pageSize > 0) totalPages++;
    final int currentPage = (json['skip'] ~/ pageSize) + 1;
    return RecipesResp(
      list: RecipeListConvert.from(json['recipes']),
      totalPages: totalPages,
      currentPage: currentPage,
      pageSize: pageSize,
    );
  }
}
