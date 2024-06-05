import 'package:flutter/material.dart';

import '../../../../../_shared/widgets/app_bar/app_app_bar.dart';
import '../../../../../core/l10n/l10n_helper.dart';
import 'widgets/product_tile.dart';
import 'widgets/products_builder.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        canPop: false,
        title: context.s.products,
      ),
      body: ProductsBuilder(
        builder: (data) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 50),
            itemCount: data.data.list?.length ?? 0,
            itemBuilder: (context, index) {
              final item = data.data.list![index];
              return ProductTile(item);
            },
          );
        },
      ),
    );
  }
}
