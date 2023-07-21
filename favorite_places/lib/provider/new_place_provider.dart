import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/places.dart';
import 'package:path_provider/path_provider.dart' as sys_path;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

Future<Database> getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'), onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE user_places(id Text PRIMARY KEY, name TEXT, address TEXT , lat REAL , long REAL , image TEXT)',
    );
  }, version: 1);

  return db;
}

class NewPlaceProvider extends StateNotifier<List<Place>> {
  NewPlaceProvider() : super([]);

  Future<void> loadPlaces() async {
    final dbase = await getDatabase();
    final data = await dbase.query('user_places');
    final placeList = data
        .map((e) => Place(
            id: e['id'] as String,
            name: e['name'] as String,
            image: File(e['image'] as String),
            address: e['address'] as String,
            lat: e['lat'] as double,
            long: e['long'] as double))
        .toList();
    state = placeList;
  }

  void addPlace(Place newPlace) async {
    final appDocumentDir = await sys_path.getApplicationDocumentsDirectory();

    final filename = path.basename(newPlace.image.path);
    print('${appDocumentDir}/$filename');
    final copiedimage =
        await newPlace.image.copy('${appDocumentDir.path}/$filename');

    final place = Place(
        name: newPlace.name,
        image: copiedimage,
        address: newPlace.address,
        lat: newPlace.lat,
        long: newPlace.long);

    final dbase = await getDatabase();

    dbase.insert('user_places', {
      'id': newPlace.id,
      'name': newPlace.name,
      'image': newPlace.image.path,
      'address': newPlace.address,
      'lat': newPlace.lat,
      'long': newPlace.long,
    });

    state = [...state, place];
  }
}

final newPlaceProvider = StateNotifierProvider<NewPlaceProvider, List<Place>>(
    (ref) => NewPlaceProvider());
