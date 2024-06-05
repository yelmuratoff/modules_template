import '../../../../../../shared/exceptions/app_exception.dart';
import '../../../../../../core/api/gateway/domain/interface/i_gateway.dart';
import '../../../_shared/data/convert/product_convert.dart';
import '../../domain/interface/i_product_repo.dart';

class ProductRepo implements IProductRepo {
  ProductRepo(this.gateway);

  final IGateway gateway;

  @override
  Future<Product> read(num id) async {
    final resp = await gateway.dio.get('/products/$id');
    try {
      return ProductConvert.fromJson(resp.data)!;
    } catch (error, stack) {
      Error.throwWithStackTrace(
        ConvertException(error.toString()),
        stack,
      );
    }
  }
}
