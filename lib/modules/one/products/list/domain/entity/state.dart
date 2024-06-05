import 'package:equatable/equatable.dart';

import '../value_objects/products_resp.dart';

sealed class ProductsState {}

class ProductsIdle extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsData extends ProductsState with EquatableMixin {
  ProductsData(
    this.data, {
    this.isLoading = false,
    this.error,
  });

  final ProductsResp data;
  final Object? error;
  final bool isLoading;

  @override
  List<Object?> get props => [data, isLoading, error];

  bool get hasError => error != null;

  ProductsData copyWith({
    ProductsResp? data,
    bool? isLoading,
    Object? error,
  }) {
    return ProductsData(
      data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class ProductsError extends ProductsState with EquatableMixin {
  ProductsError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
