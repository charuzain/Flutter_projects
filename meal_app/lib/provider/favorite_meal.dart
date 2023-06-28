// StateNotifier  is an observable class that can store one single state.

// StateNotifier is designed to be subclassed, which means you need to extend your class with this class.

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  // It is essential to note that when you extend your class with StateNotifier, you must pass the initial value in the constructor, or else you will encounter an error. So let's provide the initial value.
  FavoriteMealNotifier() : super([]);

  bool addToFavorite(Meal meal) {
    bool isInFavorite = state.contains(meal);

    if (isInFavorite) {
      // remove from list
      state = state.where((m) => m.id != meal.id).toList();
      return true;
    } else {
      state = [...state, meal];
      return false;
    }
  }
}

// Good explanation
// https://dhruvnakum.xyz/flutter-riverpod-stateprovider-statenotifier-statenotifierprovider-futureprovider-streamprovider

// StateNotifierProvider is a provider that is used to listen to and expose a StateNotifier.

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>(
        (ref) => FavoriteMealNotifier());

// Here, we need to define two things:

// The notifier itself and (FavoriteMealNotifier)

// The actual data type of the state (List<Meal>)

