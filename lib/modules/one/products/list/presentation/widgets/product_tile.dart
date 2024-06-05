import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/l10n/l10n_helper.dart';
import '../../../../../../core/navigation/navigator1_helper.dart';
import '../../../_shared/domain/value_objects/product.dart';
import '../../../details/presentation/product_details_screen.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(this.item, {super.key});

  final Product item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: CachedNetworkImageProvider(item.thumbnail ?? ''),
      ),
      title: Text(item.title ?? context.s.noData),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price: ${item.price ?? context.s.noData}'),
          const Spacer(),
          Text('Stock: ${item.stock ?? context.s.noData}'),
        ],
      ),
      onTap: () {
        context.rootRouter.use.push(
          ProductDetailsScreen(id: item.id),
        );
      },
    );
  }
}
