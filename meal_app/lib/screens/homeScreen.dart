import 'package:flutter/material.dart';
import 'package:meal_app/screens/category.dart';
import 'package:meal_app/screens/meals.dart';

import '../model/meal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedVal = 0;
  final List<Meal> favoriteMeal = [];

  void addOrRemoveTofavorite(Meal meal) {
    if (favoriteMeal.contains(meal)) {
      favoriteMeal.remove(meal);
    } else {
      favoriteMeal.add(meal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedVal == 0 ? "Category" : "Favorite"),
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                  onTap: (value) => {
                        setState(
                          () {
                            selectedVal = value;
                          },
                        )
                      },
                  tabs: const [
                    Tab(text: "Category"),
                    Tab(text: "Favorite"),
                  ]),
              // Text(
              //   "Export",
              //   textAlign: TextAlign.start,
              // ),
              Expanded(
                child: TabBarView(children: [
                  CategoryScreen(addOrRemoveTofavorite: addOrRemoveTofavorite),
                  Meals(
                    mealList: favoriteMeal,
                    addOrRemoveTofavorite: addOrRemoveTofavorite,
                  )
                  // Text("No Favorite yet"),
                ]),
              )
            ],
          )),
    );
  }
}
