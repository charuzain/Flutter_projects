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

  void showPopUpMessage(String message, Color color) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      backgroundColor: color,
    ));
  }

  void addOrRemoveTofavorite(Meal meal) {
    if (favoriteMeal.contains(meal)) {
      setState(() {
        favoriteMeal.remove(meal);
        showPopUpMessage("Remove from favorite List", Colors.red);
      });
    } else {
      setState(() {
        favoriteMeal.add(meal);
        showPopUpMessage("Meal Added to favorite List", Colors.green);
      });
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
