import '../../domain/value_objects/recipes_req.dart';

extension RecipesReqConvert on RecipesReq {
  Map<String, dynamic> toJson() {
    return {
      'limit': pageSize,
      'skip': (page - 1).clamp(0, double.maxFinite).toInt() * pageSize,
    };
  }
}
