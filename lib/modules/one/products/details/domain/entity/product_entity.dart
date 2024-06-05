import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/_shared/utils/throw_if_needed.dart';
import '../interface/i_product_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class ProductEntity extends Bloc<EventProduct, ProductState> {
  ProductEntity({required this.remote}) : super(ProductIdle()) {
    on<ReadProduct>(_read);
  }

  final pageSize = 10;
  final IProductRepo remote;

  Future<void> _read(
    ReadProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final data = await remote.read(event.id);
      emit(
        ProductData(data),
      );
    } catch (error, stack) {
      emit(
        ProductError(error),
      );
      throwIfNeeded(error, stack);
    }
  }
}
