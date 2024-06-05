import '../../../../../../shared/exceptions/app_exception.dart';
import '../../../../../../core/api/gateway/domain/interface/i_gateway.dart';
import '../../../_shared/data/convert/quote_convert.dart';
import '../../../_shared/domain/value_objects/quote.dart';
import '../../domain/interface/i_quote_repo.dart';

class QuoteRepo implements IQuoteRepo {
  QuoteRepo(this.gateway);

  final IGateway gateway;

  @override
  Future<Quote> read(num id) async {
    final resp = await gateway.dio.get(
      '/quotes/$id',
    );
    final error = BackendException.fromJson(resp.data);
    if (error.messages.isNotEmpty) throw error;
    try {
      return QuoteConvert.fromJson(resp.data);
    } catch (error, stack) {
      Error.throwWithStackTrace(
        ConvertException(error.toString()),
        stack,
      );
    }
  }
}
