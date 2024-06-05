import '../../../../../../core/_shared/exceptions/app_exception.dart';
import '../../../../../../core/network/gateway/domain/interface/i_gateway.dart';
import '../../domain/interface/i_products_repo.dart';
import '../convert/products_req_convert.dart';
import '../convert/products_resp_convert.dart';

class ProductsRepo implements IProductsRepo {
  ProductsRepo(this.gateway);

  final IGateway gateway;

  @override
  Future<ProductsResp> read(ProductsReq request) async {
    final resp = await gateway.dio.get(
      '/products',
      queryParameters: request.toJson(),
    );
    final error = BackendException.fromJson(resp.data);
    if (error.messages.isNotEmpty) throw error;
    try {
      return ProductsRespConvert.fromJson(
        resp.data,
        request.pageSize,
      );
    } catch (error, stack) {
      Error.throwWithStackTrace(
        ConvertException(error.toString()),
        stack,
      );
    }
  }
}
