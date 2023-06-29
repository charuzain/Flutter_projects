import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FiltersSelected { gluten, lactose, vegetarian, vegan, selectedCategory }

class FilterNotifier extends StateNotifier<Map<FiltersSelected, bool>> {
  FilterNotifier()
      : super({
          FiltersSelected.gluten: false,
          FiltersSelected.lactose: false,
          FiltersSelected.vegan: false,
          FiltersSelected.vegetarian: false
        });

  void setFilters(Map<FiltersSelected, bool> chosenFilter) {
    state = chosenFilter;
  }

  void applyFilter(FiltersSelected filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<FiltersSelected, bool>>(
        (ref) => FilterNotifier());
