import '../../../_shared/data/convert/quote_convert.dart';
import '../../domain/value_objects/quotes_resp.dart';

abstract class QuotesRespConvert {
  static QuotesResp fromJson(dynamic json, int pageSize) {
    int totalPages = json['total'] ~/ pageSize;
    if (json['total'] % pageSize > 0) totalPages++;
    final int currentPage = (json['skip'] ~/ pageSize) + 1;
    return QuotesResp(
      list: QuotesConvert.from(json['quotes']),
      totalPages: totalPages,
      currentPage: currentPage,
      pageSize: pageSize,
    );
  }
}
