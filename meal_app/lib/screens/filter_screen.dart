import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

enum filtersSelected { gluten, lactose, vegetarian, vegan }

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenSelected = false;
  bool isLactoseSelected = false;
  bool isVegetarianSelected = false;
  bool isVeganSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Filters"),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, {
              filtersSelected.gluten: isGlutenSelected,
              filtersSelected.lactose: isLactoseSelected,
              filtersSelected.vegetarian: isVegetarianSelected,
              filtersSelected.vegan: isVeganSelected,
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
              )
            ],
          ),
        ));
  }
}
