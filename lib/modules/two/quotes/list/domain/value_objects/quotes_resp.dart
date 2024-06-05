import 'package:equatable/equatable.dart';

import '../../../_shared/domain/value_objects/quote.dart';

class QuotesResp extends Equatable {
  const QuotesResp({
    required this.totalPages,
    required this.currentPage,
    required this.pageSize,
    this.list,
  });

  final int currentPage;
  final List<Quote>? list;
  final int pageSize;
  final int totalPages;

  @override
  List<Object?> get props => [list, totalPages, currentPage, pageSize];

  QuotesResp copyWith({
    List<Quote>? list,
    int? totalPages,
    int? currentPage,
    int? pageSize,
  }) {
    return QuotesResp(
      list: list ?? this.list,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
    );
  }
}
