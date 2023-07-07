import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/places.dart';

class AddNewPlace extends StatefulWidget {
  const AddNewPlace({super.key});

  @override
  State<AddNewPlace> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends State<AddNewPlace> {
  final _formKey = GlobalKey<FormState>();
  String _placeName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add a New Place")),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  initialValue: _placeName,
                  onSaved: (newValue) {
                    _placeName = newValue!;
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
                ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pop(context, Place(name: _placeName));
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text("Save"))
              ],
            ),
          )),
    );
  }
}
