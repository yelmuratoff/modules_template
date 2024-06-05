import '../../../_shared/domain/value_objects/product.dart';

export '../../../_shared/domain/value_objects/product.dart';

abstract class IProductRepo {
  Future<Product> read(num id);
}
