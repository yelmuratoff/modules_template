import '../../domain/value_objects/quote.dart';

extension QuoteConvert on Quote {
  static Quote fromJson(dynamic json) {
    return Quote(
      id: json['id'],
      author: json['author'],
      quote: json['quote'],
    );
  }
}

abstract class QuotesConvert {
  static List<Quote>? from(List? list) {
    if (list == null) return null;
    return list.map<Quote?>(QuoteConvert.fromJson).whereType<Quote>().toList();
  }
}
