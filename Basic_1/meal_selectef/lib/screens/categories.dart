import 'package:flutter/material.dart';
import 'package:meal_selectef/models/category.dart';
import 'package:meal_selectef/screens/meals.dart';
import 'package:meal_selectef/widgets/category_grid_item.dart';

import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (cxt) =>
            MealsScreen(title: category.title, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            //* so cot cua grid
            childAspectRatio: 3 / 2,
            //* ti le chieu rong va chieu cao cua tung phan tu trong grid
            crossAxisSpacing: 20,
            //* khoang cach cross
            mainAxisSpacing: 20), //* Khoan cach main
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
