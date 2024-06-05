import '../../../_shared/data/convert/product_convert.dart';
import '../../domain/value_objects/products_resp.dart';

abstract class ProductsRespConvert {
  static ProductsResp fromJson(dynamic json, int pageSize) {
    int totalPages = json['total'] ~/ pageSize;
    if (json['total'] % pageSize > 0) totalPages++;
    final int currentPage = (json['skip'] ~/ pageSize) + 1;
    return ProductsResp(
      list: ProductsListConvert.from(json['products']),
      totalPages: totalPages,
      currentPage: currentPage,
      pageSize: pageSize,
    );
  }
}
