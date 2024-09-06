import 'package:flutter/material.dart';
import 'package:meal_selectef/widgets/category_grid_item.dart';

import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
            mainAxisSpacing: 20), //* Khonag cach main
        children: [
          for(final category in availableCategories)
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}
