import '../../../_shared/domain/value_objects/quote.dart';

abstract class IQuoteRepo {
  Future<Quote> read(num id);
}
