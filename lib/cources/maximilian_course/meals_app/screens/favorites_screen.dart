// Core
import 'package:flutter/material.dart';
// Models
import '../models/meal.dart';
// Widgets
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some! =)'),
      );
    }

    return ListView.builder(
      itemBuilder: (ctx, index) {
        Meal meal = favoriteMeals[index];

        return MealItem(
          id: meal.id,
          title: meal.title,
          imageUrl: meal.imageUrl,
          affordability: meal.affordability,
          complexity: meal.complexity,
          duration: meal.duration,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
