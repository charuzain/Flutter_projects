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
    final placeList = ref.watch(newPlaceProvider.notifier).loadPlaces();
    print("===============");
    print(placeList);
    print("===============");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Places"),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddNewPlace()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      // body: placeList.isEmpty
      //     ? Center(
      //         child: Padding(
      //           padding: const EdgeInsets.all(18.0),
      //           child: Text(
      //               "Currently there are no places added to list. Click on Icon to add places",
      //               style: Theme.of(context).textTheme.bodyLarge!.copyWith(
      //                   color: Theme.of(context).colorScheme.onPrimaryContainer,
      //                   fontSize: 26)),
      //         ),
      //       )
//           : Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: ListView.builder(
//                   itemCount: placeList.length,
//                   itemBuilder: (ctx, index) => Padding(
//                         padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
//                         child: ListTile(
//                           tileColor: Color.fromARGB(255, 228, 156, 41),
//                           hoverColor: Colors.blue,

//                           // tileColor: Theme.of(context).colorScheme.secondary,
//                           leading: CircleAvatar(
//                             radius: 26,
//                             backgroundImage: Image.file(
//                               placeList[index].image,
//                               fit: BoxFit.cover,
//                             ).image,

//                             // child: Image.file(placeList[index].image),
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => PlaceDetail(
//                                           place: placeList[index],
//                                         )));
//                           },
//                           title: Padding(
//                             padding: const EdgeInsets.fromLTRB(6, 0, 10, 0),
//                             child: Text(
//                               placeList[index].name,
//                               style: const TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                   letterSpacing: 0.8),
//                             ),
//                           ),
// subtitle:  Padding(
//   padding: const EdgeInsets.fromLTRB(6, 0, 10, 0),
//   child:   Text(
//     placeList[index].address,
//     style: TextStyle(
//         fontSize: 18,
//         color: Colors.white,
//         letterSpacing: 0.8),
//   ),
// ),
//                           trailing:
//                           Icon(
//                             Icons.arrow_forward_ios,
//                             color: Colors.black,
//                           ),
//                         ),
//                       )),
//             ),
    );
  }
}
