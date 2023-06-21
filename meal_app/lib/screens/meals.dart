
import 'package:flutter/material.dart';
import 'package:meal_app/model/category.dart';

import '../model/meal.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.category, required this.mealList});
  final Category category;
  final List<Meal> mealList;

  // List<Meal> getMeals() {
  //   return dummyMeals
  //       .where((meal) => meal.categories.contains(category.id))
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) => Text(
          mealList[index].title,
          style: const TextStyle(color: Colors.white24, fontSize: 32),
        ),
      ),
    );
  }
}
