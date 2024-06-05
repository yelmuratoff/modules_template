import 'package:equatable/equatable.dart';

import '../../../_shared/domain/value_objects/product.dart';

export '../../../_shared/domain/value_objects/product.dart';

class ProductsResp extends Equatable {
  const ProductsResp({
    required this.totalPages,
    required this.currentPage,
    required this.pageSize,
    this.list,
  });

  final int currentPage;
  final List<Product>? list;
  final int pageSize;
  final int totalPages;

  @override
  List<Object?> get props => [list, totalPages, currentPage, pageSize];

  ProductsResp copyWith({
    List<Product>? list,
    int? totalPages,
    int? currentPage,
    int? pageSize,
  }) {
    return ProductsResp(
      list: list ?? this.list,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
    );
  }
}
