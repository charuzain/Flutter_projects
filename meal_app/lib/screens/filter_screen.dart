import 'package:flutter/material.dart';

import '../data/categoryList.dart';
import 'filtered_meal.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

enum FiltersSelected { gluten, lactose, vegetarian, vegan, selectedCategory }

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenSelected = false;
  bool isLactoseSelected = false;
  bool isVegetarianSelected = false;
  bool isVeganSelected = false;

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Filters"),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, {
              FiltersSelected.gluten: isGlutenSelected,
              FiltersSelected.lactose: isLactoseSelected,
              FiltersSelected.vegetarian: isVegetarianSelected,
              FiltersSelected.vegan: isVeganSelected,
            });
            return false;
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SwitchListTile(
                  tileColor: Theme.of(context).colorScheme.secondaryContainer,
                  value: isGlutenSelected,
                  onChanged: (newValue) {
                    setState(() {
                      isGlutenSelected = newValue;
                    });
                  },
                  title: Text("Gluten-free",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                  subtitle: Text("Only Include gluten free meals",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white)),
                  contentPadding: EdgeInsets.all(20),
                  activeColor: Theme.of(context).colorScheme.primaryContainer,
                  activeTrackColor: Theme.of(context).colorScheme.primary,
                  //  inactiveTrackColor: Colors.red,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SwitchListTile(
                  tileColor: Theme.of(context).colorScheme.secondaryContainer,
                  value: isLactoseSelected,
                  onChanged: (newValue) {
                    setState(() {
                      isLactoseSelected = newValue;
                    });
                  },
                  title: Text("Lactose-free",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                  subtitle: Text("Only Include lactose free meals",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white)),
                  contentPadding: EdgeInsets.all(20),
                  activeColor: Theme.of(context).colorScheme.primaryContainer,
                  activeTrackColor: Theme.of(context).colorScheme.primary,
                  //  inactiveTrackColor: Colors.red,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SwitchListTile(
                  tileColor: Theme.of(context).colorScheme.secondaryContainer,
                  value: isVegetarianSelected,
                  onChanged: (newValue) {
                    setState(() {
                      isVegetarianSelected = newValue;
                    });
                  },
                  title: Text("Vegetarian",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                  subtitle: Text("Only Include vegetarian meals",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white)),
                  contentPadding: EdgeInsets.all(20),
                  activeColor: Theme.of(context).colorScheme.primaryContainer,
                  activeTrackColor: Theme.of(context).colorScheme.primary,
                  //  inactiveTrackColor: Colors.red,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SwitchListTile(
                  tileColor: Theme.of(context).colorScheme.secondaryContainer,
                  value: isVeganSelected,
                  onChanged: (newValue) {
                    setState(() {
                      isVeganSelected = newValue;
                    });
                  },
                  title: Text("Vegan",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                  subtitle: Text("Only Include vegan meals",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white)),
                  contentPadding: EdgeInsets.all(20),
                  activeColor: Theme.of(context).colorScheme.primaryContainer,
                  activeTrackColor: Theme.of(context).colorScheme.primary,
                  //  inactiveTrackColor: Colors.red,),
                ),
              ),

              // Container(
              //   height: 50,
              //   child: CupertinoPicker(

              //       selectionOverlay: const Padding(
              //         padding:
              //             EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              //         child: Text("Category"),
              //       ),
              //       useMagnifier: true,
              //       backgroundColor:
              //           Theme.of(context).colorScheme.secondaryContainer,
              //       itemExtent: 60,
              //       onSelectedItemChanged: (int) {
              //         print(int);
              //         selectedCategory = categoryList[int].id;
              //         print(selectedCategory);
              //       },
              //       children: categoryList
              //           .map((e) => Container(
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(12.0),
              //                   child: Text(e.title),
              //                 ),
              //               ))
              //           .toList()),
              // ),

              Container(
                color: Theme.of(context).colorScheme.secondaryContainer,
                width: double.infinity,
                child: Center(
                  child: DropdownButton(
                    hint: Text('Select a category'),
                    value: selectedCategory,
                    items: [
                      ...categoryList
                          .map((cat) => DropdownMenuItem(
                                child: Text(
                                  cat.title,
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: cat.id,
                              ))
                          .toList()
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                      print(selectedCategory);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) =>
                                    FilteredMeal(filtersSelected: {
                                      FiltersSelected.gluten: isGlutenSelected,
                                      FiltersSelected.lactose:
                                          isLactoseSelected,
                                      FiltersSelected.vegetarian:
                                          isVegetarianSelected,
                                      FiltersSelected.vegan: isVeganSelected,
                                      FiltersSelected.selectedCategory:
                                          selectedCategory ?? "c1"
                                    })));
                      },
                      child: const Text(
                        "Apply Filters",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))),
            ],
          ),
        ));
  }
}
