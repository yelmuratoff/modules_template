import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../_shared/widgets/app_error_widget.dart';
import '../../../../../../_shared/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../../../di.dart';
import '../../../../backend/one_backend.dart';
import '../../data/repo/product_repo.dart';
import '../../domain/entity/product_entity.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({
    required this.builder,
    required this.id,
    super.key,
  });
  final num id;

  final Widget Function(ProductData state) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductEntity(
        remote: ProductRepo(
          appDi.current.get<OneBackend>().gateway,
        ),
      )..add(ReadProduct(id)),
      child: BlocBuilder<ProductEntity, ProductState>(
        builder: (context, state) {
          return switch (state) {
            ProductIdle _ => const SizedBox.shrink(),
            ProductLoading _ => const AppProgressIndicator(),
            final ProductError state => AppErrorWidget(
                error: state.error,
                onRetry: () {
                  context.read<ProductEntity>().add(
                        ReadProduct(id),
                      );
                },
              ),
            final ProductData state => builder(state),
          };
        },
      ),
    );
  }
}
