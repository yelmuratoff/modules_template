import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/_shared/utils/throw_if_needed.dart';
import '../interface/i_products_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class ProductsEntity extends Bloc<EventProducts, ProductsState> {
  ProductsEntity({required this.remote}) : super(ProductsIdle()) {
    on<ReadProducts>(_read);
    on<NextPageOfProducts>(_nextPage);
  }

  final pageSize = 10;
  final IProductsRepo remote;

  Future<void> _read(
    ReadProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final resp = await remote.read(
        ProductsReq(
          page: 1,
          pageSize: pageSize,
        ),
      );
      emit(
        ProductsData(resp),
      );
    } catch (error, stack) {
      emit(
        ProductsError(error),
      );
      throwIfNeeded(error, stack);
    }
  }

  Future<void> _nextPage(
    NextPageOfProducts event,
    Emitter<ProductsState> emit,
  ) async {
    if (state is! ProductsData) return;
    final current = state as ProductsData;
    if (current.data.currentPage == current.data.totalPages) return;
    emit(
      current.copyWith(isLoading: true),
    );

    try {
      final resp = await remote.read(
        ProductsReq(
          page: current.data.currentPage + 1,
          pageSize: pageSize,
        ),
      );
      emit(
        ProductsData(
          resp.copyWith(
            list: [
              ...current.data.list ?? [],
              ...resp.list ?? [],
            ],
          ),
        ),
      );
    } catch (error, stack) {
      emit(
        current.copyWith(
          isLoading: false,
          error: error,
        ),
      );
      throwIfNeeded(error, stack);
    }
  }
}
