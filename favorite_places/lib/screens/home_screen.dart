import 'package:favorite_places/miodel/places.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../data/places_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Places"),
        actions: [
          IconButton(
              onPressed: () async {
                Place result = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const AddNewPlace()));
                print(result);

                setState(() {
                  placesList.add(result);
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: placesList.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                    "Currently there are no places added to list. Click on Icon to add places",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 26)),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                  itemCount: placesList.length,
                  itemBuilder: (ctx, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          placesList[index].name,
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        ),
                      )),
            ),
    );
  }
}
