import 'package:flutter/material.dart';
import 'package:meal_app/model/category.dart';
import 'package:transparent_image/transparent_image.dart';

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
        itemBuilder: (context, index) => Card(
          child: Stack(
            children: [
              // Image(
              //   image: NetworkImage(mealList[index].imageUrl),
              //   fit: BoxFit.cover,
              // ),
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealList[index].imageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.black45,
                  child: Text(
                    mealList[index].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
