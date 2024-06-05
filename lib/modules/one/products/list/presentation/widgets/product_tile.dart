import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/l10n/generated/l10n.dart';
import '../../../../../../core/router/navigator1_helper.dart';
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
      title: Text(item.title ?? L10n.current.noData),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price: ${item.price ?? L10n.current.noData}'),
          const Spacer(),
          Text('Stock: ${item.stock ?? L10n.current.noData}'),
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
