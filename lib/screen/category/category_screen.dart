import 'package:flutter/material.dart';
import 'package:meal_app/screen/category/data/dummy_data.dart';
import 'package:meal_app/screen/category/model/category.dart';
import 'package:meal_app/screen/category/widget/category_grid_item.dart';
import 'package:meal_app/screen/meal/data/dummy_data.dart';
import 'package:meal_app/screen/meal/meal_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) =>
            MealScreen(meals: filteredMeal, title: category.title)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: availableCategories
              .map((category) => CategoryGridItem(
                    category: category,
                    onSelectCategory: () {
                      _selectCategory(context, category);
                    },
                  ))
              .toList()
          // for(final category in availableCategories)
          //   CategoryGridItem(category: category,)
          ),
    );
  }
}
