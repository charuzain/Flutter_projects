import 'package:favorite_places/model/places.dart';
import 'package:favorite_places/provider/placeProvider.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/new_place_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final placeList = ref.watch(newPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Places"),
        actions: [
          IconButton(
              onPressed: () async {
                Place result = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const AddNewPlace()));
                // print(result);

                // setState(() {
                ref.watch(newPlaceProvider.notifier).addPlace(result);
                // });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: placeList.isEmpty
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
                  itemCount: placeList.length,
                  itemBuilder: (ctx, index) => ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaceDetail()));
                        },
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            placeList[index].name,
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                          ),
                        ),
                      )),
            ),
    );
  }
}
