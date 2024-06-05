import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../shared/presentation/widgets/app_bar/app_app_bar.dart';
import '../../../../../core/router/navigator1_helper.dart';
import '../../details/presentation/recipe_details_screen.dart';
import 'widgets/recipes_builder.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        canPop: false,
        title: L10n.current.receipes,
      ),
      body: RecipesBuilder(
        builder: (data) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 50),
            itemCount: data.data.list?.length ?? 0,
            itemBuilder: (context, index) {
              final item = data.data.list![index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(item.image ?? ''),
                ),
                title: Text(item.name ?? L10n.current.noData),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Difficulty: ${item.difficulty ?? L10n.current.noData}',
                    ),
                    Text(
                      'Calories: ${item.caloriesPerServing ?? L10n.current.noData}',
                    ),
                    Text(
                      'Cook time: ${item.cookTimeMinutes ?? L10n.current.noData}',
                    ),
                  ],
                ),
                onTap: () {
                  context.rootRouter.use.push(
                    RecipeDetailsScreen(id: item.id),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
