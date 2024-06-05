import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../shared/presentation/widgets/app_bar/app_app_bar.dart';
import 'widgets/product_builder.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    required this.id,
    super.key,
  });

  final num id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: 'Product Details',
      ),
      body: ProductBuilder(
        id: id,
        builder: (data) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 3,
                backgroundImage:
                    CachedNetworkImageProvider(data.item.thumbnail ?? ''),
              ),
              const SizedBox(height: 16),
              Text(data.item.title ?? L10n.current.noData),
              Text('Brand: ${data.item.brand ?? L10n.current.noData}'),
              Text('Price: ${data.item.price ?? L10n.current.noData}'),
              Text('Stock: ${data.item.stock ?? L10n.current.noData}'),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                shrinkWrap: true,
                itemCount: data.item.images?.length ?? 0,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: data.item.images![index].fullPath,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
