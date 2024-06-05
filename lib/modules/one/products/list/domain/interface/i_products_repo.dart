import '../value_objects/products_req.dart';
import '../value_objects/products_resp.dart';

export '../value_objects/products_req.dart';
export '../value_objects/products_resp.dart';

abstract class IProductsRepo {
  Future<ProductsResp> read(ProductsReq request);
}
