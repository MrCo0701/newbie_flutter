import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_selectef/data/dummy_data.dart';
import 'package:meal_selectef/providers/meals_provider.dart';
import 'package:meal_selectef/screens/categories.dart';
import 'package:meal_selectef/screens/filter.dart';
import 'package:meal_selectef/screens/meals.dart';
import 'package:meal_selectef/widgets/main_drawer.dart';

import '../models/meal.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favoriteMeals = [];

  Map<Filter, bool> _selectFilter = kInitialFilter;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer a favorite');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage('Marked as a favorite');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    final availableMeals = meals.where((meal) {
      if (_selectFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage =
        CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus, availableMeals: availableMeals,);
    var activePageTitle = 'Categorise';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        // ? lam sang nhung icon nao duoc select vao
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (cxt) => FilterScreen(
                    currentFilters: _selectFilter,
                  ))); // ? thay vi chong thi minh xoa man hinh truoc do luon

      _selectFilter = result ??
          kInitialFilter; // ? ==> neu = null thi tra ve kInitialFilter
    }
  }
}
