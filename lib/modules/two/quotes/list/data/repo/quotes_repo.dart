import '../../../../../../core/_shared/exceptions/app_exception.dart';
import '../../../../../../core/network/gateway/domain/interface/i_gateway.dart';
import '../../domain/interface/i_quotes_repo.dart';
import '../convert/quotes_req_convert.dart';
import '../convert/quotes_resp_convert.dart';

class QuotesRepo implements IQuotesRepo {
  QuotesRepo(this.gateway);

  final IGateway gateway;

  @override
  Future<QuotesResp> read(QuotesReq request) async {
    final resp = await gateway.dio.get(
      '/quotes',
      queryParameters: request.toJson(),
    );
    final error = BackendException.fromJson(resp.data);
    if (error.messages.isNotEmpty) throw error;
    try {
      return QuotesRespConvert.fromJson(
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
