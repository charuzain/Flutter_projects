import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:meal_app/data/categoryList.dart';
import 'package:meal_app/model/category.dart';

import '../model/meal.dart';

class Meals extends StatelessWidget {
  Meals({super.key, required this.category});
  final Category category;

  List<Meal> getMeals() {
    return dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meals")),
      body: ListView.builder(
        itemCount: getMeals().length,
        itemBuilder: (context, index) => Text(
          getMeals()[index].title,
          style: TextStyle(color: Colors.white24, fontSize: 32),
        ),
      ),
    );
  }
}
