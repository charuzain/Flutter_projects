import 'dart:io';

import 'package:favorite_places/data/places_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/places.dart';
import 'package:path_provider/path_provider.dart' as sys_path;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class NewPlaceProvider extends StateNotifier<List<Place>> {
  NewPlaceProvider() : super([]);

  void addPlace(Place newPlace) async {
    // step 1 We call getApplicationDocumentsDirectory. This comes from the path_provider package that we installed earlier. This will get whatever the common documents directory is for the platform that we are using. Use the getApplicationDocumentsDirectory() to get the Path to a directory where your application will place data.
    final appDocumentDir = await sys_path.getApplicationDocumentsDirectory();

// step 2 copy image to new path    // newPlace.image.copy(newPath) but newPath requires string not directory object and also it should include file name . First get file name of image as string

// get file name by path package  To get the image name use the path.basename(url) method.
    final filename = path.basename(newPlace.image.path);
    print("==================");
    print(filename);
    print('${appDocumentDir}/$filename');
    // finallay copy the image
    final copiedimage =
        await newPlace.image.copy('${appDocumentDir.path}/$filename');

    final place = Place(
        name: newPlace.name,
        image: copiedimage,
        address: newPlace.address,
        lat: newPlace.lat,
        long: newPlace.long);

    // final dbPath = sql.getDatabasesPath()
    // Get a location using getDatabasesPath
    final dbPath = await getDatabasesPath();

// open database
    final database = await openDatabase(
        // Set the path to the database. Note: Using the `join` function from the
        // `path` package is best practice to ensure the path is correctly
        // constructed for each platform.
        // image is Text as we will just store the file path not the image itself
        join(await getDatabasesPath(), 'new_places.db'),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE places(id INTEGER PRIMARY KEY, name TEXT, address TEXT , lat REAL , long REAL , image TEXT)',
      );
    }, version: 1);
    // insert data
    database.insert('places', {
      'id': newPlace.id,
      'name':newPlace.name,
      'image':newPlace.image.path,
      'address':newPlace.address,
      'lat':newPlace.lat,
      'long':newPlace.long,

    });

    state = [...state, place];
  }
}

final newPlaceProvider = StateNotifierProvider<NewPlaceProvider, List<Place>>(
    (ref) => NewPlaceProvider());
