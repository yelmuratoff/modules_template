import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../shared/presentation/widgets/app_bar/app_app_bar.dart';
import 'widgets/recipe_builder.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({
    required this.id,
    super.key,
  });

  final num id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: 'Recipe Details',
      ),
      body: RecipeBuilder(
        id: id,
        builder: (data) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 3,
                backgroundImage:
                    CachedNetworkImageProvider(data.item.image ?? ''),
              ),
              const SizedBox(height: 16),
              Text(data.item.name ?? L10n.current.noData),
              Text(
                'Difficulty: ${data.item.difficulty ?? L10n.current.noData}',
              ),
              Text(
                'Calories: ${data.item.caloriesPerServing ?? L10n.current.noData}',
              ),
              Text(
                'Cook time: ${data.item.cookTimeMinutes ?? L10n.current.noData}',
              ),
            ],
          );
        },
      ),
    );
  }
}
