import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/categoryList.dart';
import '../provider/filter_provider.dart';
import 'filtered_meal.dart';

class FilterScreen extends ConsumerStatefulWidget {
  FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

// // enum FiltersSelected { gluten, lactose, vegetarian, vegan, selectedCategory }

class _FilterScreenState extends ConsumerState<FilterScreen> {
//   @override
//   void initState() {
//     super.initState();
//     final activeFilter = ref.read(filterProvider);
//   }

//   bool isGlutenSelected = false;
//   bool isLactoseSelected = false;
//   bool isVegetarianSelected = false;
//   bool isVeganSelected = false;

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Filters"),
        ),
        body:
            // WillPopScope(
            //   onWillPop: () async {
            //     ref.read(filterProvider.notifier).setFilters({
            //       FiltersSelected.gluten: isGlutenSelected,
            //       FiltersSelected.lactose: isLactoseSelected,
            //       FiltersSelected.vegetarian: isVegetarianSelected,
            //       FiltersSelected.vegan: isVeganSelected,
            //     });
            //     // Navigator.pop(context, {
            //     //   FiltersSelected.gluten: isGlutenSelected,
            //     //   FiltersSelected.lactose: isLactoseSelected,
            //     //   FiltersSelected.vegetarian: isVegetarianSelected,
            //     //   FiltersSelected.vegan: isVeganSelected,
            //     // });
            //     return true;
            //   },
            Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SwitchListTile(
                tileColor: Theme.of(context).colorScheme.secondaryContainer,
                value: activeFilters[FiltersSelected.gluten]!,
                onChanged: (newValue) {
                  ref
                      .read(filterProvider.notifier)
                      .applyFilter(FiltersSelected.gluten, newValue);
                  // setState(() {
                  //   isGlutenSelected = newValue;
                  // });
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
                value: activeFilters[FiltersSelected.lactose]!,
                onChanged: (newValue) {
                  ref
                      .read(filterProvider.notifier)
                      .applyFilter(FiltersSelected.lactose, newValue);
                  // setState(() {
                  //   isLactoseSelected = newValue;
                  // });
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
                value: activeFilters[FiltersSelected.vegetarian]!,
                onChanged: (newValue) {
                  ref
                      .read(filterProvider.notifier)
                      .applyFilter(FiltersSelected.vegetarian, newValue);
                  // setState(() {
                  //   isVegetarianSelected = newValue;
                  // });
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
                value: activeFilters[FiltersSelected.vegan]!,
                onChanged: (newValue) {
                  ref
                      .read(filterProvider.notifier)
                      .applyFilter(FiltersSelected.vegan, newValue);
                  // setState(() {
                  //   isVeganSelected = newValue;
                  // });
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
                              builder: (ctx) => FilteredMeal(filtersSelected: {
                                    FiltersSelected.gluten:
                                        activeFilters[FiltersSelected.gluten]!,
                                    FiltersSelected.lactose:
                                        activeFilters[FiltersSelected.lactose]!,
                                    FiltersSelected.vegetarian: activeFilters[
                                        FiltersSelected.vegetarian]!,
                                    FiltersSelected.vegan:
                                        activeFilters[FiltersSelected.vegan]!,
                                    // FiltersSelected.gluten: isGlutenSelected,
                                    // FiltersSelected.lactose: isLactoseSelected,
                                    // FiltersSelected.vegetarian:
                                    //     isVegetarianSelected,
                                    // FiltersSelected.vegan: isVeganSelected,
                                    FiltersSelected.selectedCategory:
                                        selectedCategory ?? "c1"
                                  })));
                    },
                    child: const Text(
                      "Apply Filters",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ))),
          ],
          // ),
        ));
  }
}
