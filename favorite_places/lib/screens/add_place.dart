import 'package:favorite_places/provider/new_place_provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/places.dart';
import '../widget/location.dart';
import '../widget/take_picture.dart';

class AddNewPlace extends ConsumerStatefulWidget {
  const AddNewPlace({super.key});

  @override
  ConsumerState<AddNewPlace> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends ConsumerState<AddNewPlace> {
  final _formKey = GlobalKey<FormState>();
//  final String _placeName = '';
  late File newImage;
  late String userAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add a New Place")),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    // initialValue: _placeName,
                    onSaved: (newValue) {
                      ref
                          .watch(newPlaceProvider.notifier)
                          .addPlace(Place(name: newValue!, image: newImage , address: userAddress ));
                    },
                    validator: (value) {
                      // print(value);
                      if (value == null || value.isEmpty) {
                        return "Enter a value";
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(label: Text("Enter name of the place")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TakePicture(
                    getNewImage: (File image) => {newImage = image},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Location(
                    getAddressAsString : (String newAddress)=> {userAddress = newAddress}
                  ),


                  ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Save"))
                ],
              ),
            )),
      ),
    );
  }
}

// class TakePicture extends StatefulWidget {
//   const TakePicture({
//     super.key,
//   });

//   @override
//   State<TakePicture> createState() => _TakePictureState();
// }

// class _TakePictureState extends State<TakePicture> {
//   @override
//   Widget build(BuildContext context) {
//     return TextButton.icon(
//         onPressed: () {},
//         icon: Icon(Icons.camera),
//         label: Text("Take a picture"));
//   }
// }
