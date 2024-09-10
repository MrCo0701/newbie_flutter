import 'package:flutter/material.dart';
import 'package:meal_selectef/models/meal.dart';
import 'package:meal_selectef/screens/meal_details.dart';
import 'package:meal_selectef/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (cxt) =>
            MealDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        // ? => Column nay chi chiem het phan con cua no va se khong mo rong them
        children: [
          Text(
            'Uh oh ...  nothing here!!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (cxt, index) => MealItem(
                meal: meals[index],
                onSelectMeal: (meal) {
                  selectMeal(context, meal);
                },
              ));
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
