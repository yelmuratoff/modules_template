import '../value_objects/recipes_req.dart';
import '../value_objects/recipes_resp.dart';

export '../value_objects/recipes_req.dart';
export '../value_objects/recipes_resp.dart';

abstract class IRecipesRepo {
  Future<RecipesResp> read(RecipesReq request);
}
