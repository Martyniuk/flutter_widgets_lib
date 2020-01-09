// Core
import 'package:flutter/material.dart';

// Widgets
import '../widgets/category_item.dart';

// Dummy_data
import '../dummy_data/dummy_data.dart';

// Models
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/';
  List<Widget> renderCategories = DUMMY_CATEGORIES.map((Category category) {
    return CategoryItem(category.id, category.title, category.color);
  }).toList();

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25.0),
      children: renderCategories,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
