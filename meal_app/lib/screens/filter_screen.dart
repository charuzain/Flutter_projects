import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
        ),
        body: Column(
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
            )
          ],
        ));
  }
}
