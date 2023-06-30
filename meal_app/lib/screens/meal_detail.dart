import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/favorite_meal.dart';

import '../model/meal.dart';

class MealDetail extends ConsumerWidget {
  const MealDetail({
    super.key,
    required this.selectedMeal,
    // required this.addOrRemoveTofavorite
  });
  final Meal selectedMeal;
  // final void Function(Meal meal) addOrRemoveTofavorite;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeal = ref.watch(favoriteMealProvider);
    bool isFavorite = favoriteMeal.contains(selectedMeal);
    return (Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: [
          IconButton(
              onPressed: () {
                bool alreadyPresentInFavorite = ref
                    .read(favoriteMealProvider.notifier)
                    .addToFavorite(selectedMeal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: alreadyPresentInFavorite
                      ? const Text("Removed from favorite list")
                      : const Text("Added to favorite List"),
                  backgroundColor:
                      alreadyPresentInFavorite ? Colors.red : Colors.green,
                ));
              },
              icon: isFavorite
                  ? Icon(
                      Icons.favorite,
                      color: Colors.yellow,
                    )
                  : Icon(
                      Icons.favorite_outline_outlined,
                    ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Hero(
            tag: selectedMeal.id,
            child: Image.network(
              selectedMeal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Ingredients",
              style: TextStyle(
                  fontSize: 32, color: Theme.of(context).colorScheme.primary)),
          const SizedBox(
            height: 5,
          ),
          ...selectedMeal.ingredients.map(
            (ingredient) => Text(
              ingredient,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text("Steps",
              style: TextStyle(
                  fontSize: 32, color: Theme.of(context).colorScheme.primary)),
          const SizedBox(
            height: 5,
          ),
          for (final step in selectedMeal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                step,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
        ]),
      ),
    ));
  }
}

// class MealDetail extends StatelessWidget {
//   MealDetail({super.key , required this.selectedMeal});

//   final Meal selectedMeal;
//   @override
//   build(BuildContext context) {
//     return (Scaffold(
//       appBar: AppBar(title: Text("MEal Deyail")),
//     ));
//   }
// }
