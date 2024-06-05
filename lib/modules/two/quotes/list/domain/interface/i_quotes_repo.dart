import '../value_objects/quotes_req.dart';
import '../value_objects/quotes_resp.dart';

export '../value_objects/quotes_req.dart';
export '../value_objects/quotes_resp.dart';

abstract class IQuotesRepo {
  Future<QuotesResp> read(QuotesReq request);
}
