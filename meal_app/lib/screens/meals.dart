import 'package:flutter/material.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/screens/meal_detail.dart';
import 'package:transparent_image/transparent_image.dart';

import '../model/meal.dart';
import '../widgets/meal_item_meta_data.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, this.category, 
  required this.mealList , 
  // required this.addOrRemoveTofavorite
  });
  
  final Category? category;
  final List<Meal> mealList;
  // final Function(Meal meal) addOrRemoveTofavorite;

  @override
  Widget build(BuildContext context) {
    if (category == null) {
      return ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            // print('${mealList[index]} clicked');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MealDetail(
                      selectedMeal: mealList[index],
                      // addOrRemoveTofavorite: addOrRemoveTofavorite,
                    )));
          },
          child: Card(
            // margin: EdgeInsets.all(10),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                // Image(
                //   image: NetworkImage(mealList[index].imageUrl),
                //   fit: BoxFit.cover,
                // ),
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(mealList[index].imageUrl),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    color: Colors.black45,
                    child: Column(
                      children: [
                        Text(
                          mealList[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MealItemMetaData(
                              title:
                                  '${mealList[index].duration.toString()} mins',
                              icon: Icons.timer,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemMetaData(
                                title: mealList[index]
                                        .complexity
                                        .name[0]
                                        .toUpperCase() +
                                    mealList[index]
                                        .complexity
                                        .name
                                        .substring(1),
                                icon: Icons.work),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemMetaData(
                                title: mealList[index]
                                        .affordability
                                        .name[0]
                                        .toUpperCase() +
                                    mealList[index]
                                        .affordability
                                        .name
                                        .substring(1),
                                icon: Icons.currency_rupee),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(category!.title)),
      body: ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            // print('${mealList[index]} clicked');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MealDetail(
                      selectedMeal: mealList[index],
                      // addOrRemoveTofavorite: addOrRemoveTofavorite
                    )));
          },
          child: Card(
            // margin: EdgeInsets.all(10),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                // Image(
                //   image: NetworkImage(mealList[index].imageUrl),
                //   fit: BoxFit.cover,
                // ),
                Hero(
                  tag: mealList[index].id,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(mealList[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    color: Colors.black45,
                    child: Column(
                      children: [
                        Text(
                          mealList[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MealItemMetaData(
                              title:
                                  '${mealList[index].duration.toString()} mins',
                              icon: Icons.timer,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemMetaData(
                                title: mealList[index]
                                        .complexity
                                        .name[0]
                                        .toUpperCase() +
                                    mealList[index]
                                        .complexity
                                        .name
                                        .substring(1),
                                icon: Icons.work),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemMetaData(
                                title: mealList[index]
                                        .affordability
                                        .name[0]
                                        .toUpperCase() +
                                    mealList[index]
                                        .affordability
                                        .name
                                        .substring(1),
                                icon: Icons.currency_rupee),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
