import '../../domain/value_objects/quotes_req.dart';

extension QuotesReqConvert on QuotesReq {
  Map<String, dynamic> toJson() {
    return {
      'limit': pageSize,
      'skip': (page - 1).clamp(0, double.maxFinite).toInt() * pageSize,
    };
  }
}
