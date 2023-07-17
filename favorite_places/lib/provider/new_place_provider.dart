import 'dart:io';

import 'package:favorite_places/data/places_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/places.dart';
import 'package:path_provider/path_provider.dart' as sys_path;
import 'package:path/path.dart' as path;

class NewPlaceProvider extends StateNotifier<List<Place>> {
  NewPlaceProvider() : super([]);

  void addPlace(Place newPlace) async {
    // step 1 We call getApplicationDocumentsDirectory. This comes from the path_provider package that we installed earlier. This will get whatever the common documents directory is for the platform that we are using. Use the getApplicationDocumentsDirectory() to get the Path to a directory where your application will place data.
    Directory appDocumentDir =
        await sys_path.getApplicationDocumentsDirectory();

// step 2 copy image to new path    // newPlace.image.copy(newPath) but newPath requires string not directory object and also it should include file name . First get file name of image as string

// get file name by path package  To get the image name use the path.basename(url) method.
   final filename =  path.basename(newPlace.image.path);

   // finallay copy the image 

   final copiedimage =  await newPlace.image.copy('$appDocumentDir/$filename');



    final place = Place(
        name: newPlace.name,
        image: copiedimage,
        address: newPlace.address,
        lat: newPlace.lat,
        long: newPlace.long);

    state = [...state, place];
  }
}

final newPlaceProvider = StateNotifierProvider<NewPlaceProvider, List<Place>>(
    (ref) => NewPlaceProvider());
