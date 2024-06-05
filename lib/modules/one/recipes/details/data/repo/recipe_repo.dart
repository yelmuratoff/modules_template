import '../../../../../../shared/exceptions/app_exception.dart';
import '../../../../../../core/api/gateway/domain/interface/i_gateway.dart';
import '../../../_shared/data/convert/recipe_convert.dart';
import '../../domain/interface/i_recipe_repo.dart';

class RecipeRepo implements IRecipeRepo {
  RecipeRepo(this.gateway);

  final IGateway gateway;

  @override
  Future<Recipe> read(num id) async {
    final resp = await gateway.dio.get('/recipes/$id');
    try {
      return RecipeConvert.fromJson(resp.data)!;
    } catch (error, stack) {
      Error.throwWithStackTrace(
        ConvertException(error.toString()),
        stack,
      );
    }
  }
}
