import '../../domain/value_objects/products_req.dart';

extension ProductsReqConvert on ProductsReq {
  Map<String, dynamic> toJson() {
    return {
      'limit': pageSize,
      'skip': (page - 1).clamp(0, double.maxFinite).toInt() * pageSize,
    };
  }
}
