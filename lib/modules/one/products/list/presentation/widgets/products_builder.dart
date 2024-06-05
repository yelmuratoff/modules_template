import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/_shared/utils/extensions/object_to_error.dart';
import '../../../../../../_shared/widgets/app_error_widget.dart';
import '../../../../../../_shared/widgets/banners/show_banner.dart';
import '../../../../../../_shared/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../../../di.dart';
import '../../../../../../_shared/widgets/pagination/app_paginator.dart';
import '../../domain/entity/products_entity.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(ProductsData state) builder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsEntity, ProductsState>(
      bloc: appDi.current.get<ProductsEntity>(),
      builder: (context, state) {
        return switch (state) {
          ProductsIdle _ => const SizedBox.shrink(),
          ProductsLoading _ => const AppProgressIndicator(),
          final ProductsError state => AppErrorWidget(
              error: state.error,
              onRetry: () {
                appDi.current.get<ProductsEntity>().add(
                      ReadProducts(),
                    );
              },
            ),
          final ProductsData state => AppPaginator(
              isLoading: state.isLoading,
              margin: 50,
              onRefresh: () {
                appDi.current.get<ProductsEntity>().add(
                      ReadProducts(),
                    );
              },
              onNextPage: () {
                appDi.current.get<ProductsEntity>().add(
                      NextPageOfProducts(),
                    );
              },
              child: builder(state),
            ),
        };
      },
      listener: (context, state) {
        ShowBanner.hide();
        if (state is ProductsData && state.hasError) {
          ShowBanner.error(
            message: state.error!.toErrorMessage(),
            seconds: 3,
          );
        }
      },
    );
  }
}
