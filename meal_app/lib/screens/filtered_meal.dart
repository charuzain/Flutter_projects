import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_app/data/categoryList.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widgets/meal_item_meta_data.dart';
import 'filter_screen.dart';

class FilteredMeal extends StatelessWidget {
  FilteredMeal({required this.filtersSelected, super.key}) {
    filteredMeal = dummyMeals
        .where((meal) =>
            filtersSelected[FiltersSelected.gluten] == meal.isGlutenFree)
        .where((meal) =>
            filtersSelected[FiltersSelected.lactose] == meal.isLactoseFree)
        .where((meal) =>
            filtersSelected[FiltersSelected.vegetarian] == meal.isVegetarian)
        .where((meal) => filtersSelected[FiltersSelected.vegan] == meal.isVegan)
        .toList();
  }
  Map<FiltersSelected, bool> filtersSelected;
  late List filteredMeal;
  // final List filteredMeal = dummyMeals;

  // final List filteredMeal = dummyMeals.where(
  //     (meal) => filtersSelected[FiltersSelected.gluten] == !meal.isGlutenFree).toList();

  // print(filtersSelected)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filtered Meals")),
      body: ListView.builder(
        itemCount: filteredMeal.length,
        itemBuilder: (context, index) => SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  print("-----------");
                  print(filtersSelected);
                  print(filtersSelected[FiltersSelected.gluten]);
                },
                child: Card(
                  // margin: EdgeInsets.all(10),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      // Image(
                      //   image: NetworkImage(mealList[index].imageUrl),
                      //   fit: BoxFit.cover,
                      // ),
                      FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(filteredMeal[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          color: Colors.black45,
                          child: Column(
                            children: [
                              Text(
                                filteredMeal[index].title,
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
                                width: 14,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MealItemMetaData(
                                    title:
                                        '${filteredMeal[index].duration.toString()} mins',
                                    icon: Icons.timer,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  // MealItemMetaData(
                                  //     title: filteredMeal[index]
                                  //             .complexity
                                  //             .name[0]
                                  //             .toUpperCase() +
                                  //         filteredMeal[index]
                                  //             .complexity
                                  //             .name
                                  //             .substring(1),
                                  //     icon: Icons.work),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  // MealItemMetaData(
                                  //     title: filteredMeal[index]
                                  //             .affordability
                                  //             .name[0]
                                  //             .toUpperCase() +
                                  //         filteredMeal[index]
                                  //             .affordability
                                  //             .name
                                  //             .substring(1),
                                  //     icon: Icons.currency_rupee),
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
            ],
          ),
        ),
      ),
    );
  }
}
