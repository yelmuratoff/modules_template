import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../_shared/widgets/app_bar/app_app_bar.dart';
import '../../../../../core/l10n/l10n_helper.dart';
import '../../../../../core/navigation/navigator1_helper.dart';
import '../../details/presentation/recipe_details_screen.dart';
import 'widgets/recipes_builder.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        canPop: false,
        title: 'Recipes List',
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
                title: Text(item.name ?? context.s.noData),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Difficulty: ${item.difficulty ?? context.s.noData}'),
                    Text('Calories: ${item.caloriesPerServing ?? context.s.noData}'),
                    Text('Cook time: ${item.cookTimeMinutes ?? context.s.noData}'),
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
