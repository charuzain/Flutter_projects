import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/favorite_meal.dart';
import 'package:meal_app/screens/category.dart';
import 'package:meal_app/screens/meals.dart';

import '../model/meal.dart';
import 'filter_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedVal = 0;
  // ref.read()
  final List<Meal> favoriteMeal = [];
  // late Map<FiltersSelected, bool> val = {
  //   FiltersSelected.gluten: false,
  //   FiltersSelected.lactose: false,
  //   FiltersSelected.vegetarian: false,
  //   FiltersSelected.vegan: false,
  // };

  // void showPopUpMessage(String message, Color color) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(
  //       message,
  //       textAlign: TextAlign.center,
  //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  //     ),
  //     backgroundColor: color,
  //   ));
  // }

  // void addOrRemoveTofavorite(Meal meal) {
  //   if (favoriteMeal.contains(meal)) {
  //     setState(() {
  //       favoriteMeal.remove(meal);
  //       showPopUpMessage("Remove from favorite List", Colors.red);
  //     });
  //   } else {
  //     setState(() {
  //       favoriteMeal.add(meal);
  //       showPopUpMessage("Meal Added to favorite List", Colors.green);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final favoriteMeal = ref.read(favoriteMealProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedVal == 0 ? "Category" : "Favorite"),
      ),
      drawer: Drawer(
          child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.settings,
                  size: 24,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text("Whats Cooking",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.cookie),
            title: Text("Menu",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 22)),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.filter),
            title: Text("Filter",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 22)),
            onTap: () async {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => FilterScreen()));

              // setState(() {
              //   val = result;
              // });
            },
          ),
        ],
      )),
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
              Text(
                "Export",
                textAlign: TextAlign.start,
              ),
              Expanded(
                child: TabBarView(children: [
                  CategoryScreen(
                      // addOrRemoveTofavorite: addOrRemoveTofavorite, 
                      // val: val
                      ),
                  Meals(
                    mealList: favoriteMeal,
                    // addOrRemoveTofavorite: addOrRemoveTofavorite,
                  )
                  // Text("No Favorite yet"),
                ]),
              )
            ],
          )),
    );
  }
}
