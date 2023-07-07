import 'package:favorite_places/model/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/places_list.dart';

final placeProvider = Provider<List<Place>>((ref) => placesList);
