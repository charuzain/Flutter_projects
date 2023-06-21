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
          // margin: EdgeInsets.all(10),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          clipBehavior: Clip.hardEdge,
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
                  child: Column(
                    children: [
                      Text(
                        mealList[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            const Icon(Icons.timer),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              mealList[index].duration.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ]),
                          const SizedBox(
                            width: 30,
                          ),
                          Row(children: [
                            const Icon(Icons.gif_box),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              mealList[index].complexity.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ]),
                          const SizedBox(
                            width: 30,
                          ),
                          Row(children: [
                            const Icon(Icons.currency_exchange),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              mealList[index].affordability.name,
                              style: TextStyle(color: Colors.white),
                            ),
                          ])
                        ],
                      )
                    ],
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
