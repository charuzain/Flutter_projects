import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/provider/filter_provider.dart';

import '../data/categoryList.dart';
import '../model/meal.dart';
import 'catergory_item.dart';
import 'meals.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({
    super.key,
    // required this.addOrRemoveTofavorite,
    //  required this.val
  });

  // final Function(Meal meal) addOrRemoveTofavorite;
  // final Map<FiltersSelected, bool> val;

  // void selectCategory(BuildContext context, Category category) {
  //   List<Meal> mealList = dummyMeals
  //       .where((meal) => meal.categories.contains(category.id))
  //       .where((meal) {
  //     if (!meal.isGlutenFree && val[FiltersSelected.gluten] as bool) {
  //       return false;
  //     }
  //     if (!meal.isLactoseFree && val[FiltersSelected.lactose] as bool) {
  //       return false;
  //     }
  //     if (!meal.isVegan && val[FiltersSelected.vegan] as bool) {
  //       return false;
  //     }

  //     if (!meal.isVegetarian && val[FiltersSelected.vegetarian] as bool) {
  //       return false;
  //     }
  //     return true;
  //   }).toList();

  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => Meals(
  //                 category: category,
  //                 mealList: mealList,
  //                 // addOrRemoveTofavorite: addOrRemoveTofavorite,
  //               )));
  // }

  // final List<Meal> meal = dummyMeals
  //   .where((meal) => meal.categories.contains(CategoryScreen.id))
  //   .toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);

    void selectCategory(BuildContext context, Category category) {
      List<Meal> mealList = dummyMeals
          .where((meal) => meal.categories.contains(category.id))
          .where((meal) {
        if (!meal.isGlutenFree &&  activeFilter[FiltersSelected.gluten] as bool) {
          return false;
        }
        if (!meal.isLactoseFree &&  activeFilter[FiltersSelected.lactose] as bool) {
          return false;
        }
        if (!meal.isVegan &&  activeFilter[FiltersSelected.vegan] as bool) {
          return false;
        }

        if (!meal.isVegetarian &&  activeFilter[FiltersSelected.vegetarian] as bool) {
          return false;
        }
        return true;
      }).toList();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Meals(
                    category: category,
                    mealList: mealList,
                    // addOrRemoveTofavorite: addOrRemoveTofavorite,
                  )));
    }








    return Scaffold(
      // appBar: AppBar(title: const Text("Meals CategoryScreen")),
      body: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: categoryList
              .map((category) => CatergoryItem(
                    category: category,
                    selectCategory: () {
                      selectCategory(context, category);
                    },
                  ))
              .toList()),
    );
  }
}
