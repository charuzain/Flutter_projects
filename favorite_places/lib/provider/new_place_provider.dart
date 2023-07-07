import 'package:favorite_places/data/places_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/places.dart';

class NewPlaceProvider extends StateNotifier<List<Place>> {
  NewPlaceProvider() : super([]);

  void addPlace(Place newPlace) {
    state = [...state, newPlace];
  }
}

final newPlaceProvider = StateNotifierProvider<NewPlaceProvider, List<Place>>(
    (ref) => NewPlaceProvider());
