import 'package:equatable/equatable.dart';

import '../../../_shared/domain/value_objects/product.dart';

sealed class ProductState {}

class ProductIdle extends ProductState {}

class ProductLoading extends ProductState {}

class ProductData extends ProductState with EquatableMixin {
  ProductData(this.item);

  final Product item;

  @override
  List<Object> get props => [item];
}

class ProductError extends ProductState {
  ProductError(this.error);

  final Object? error;
}
