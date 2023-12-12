import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  String? city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  CupertinoIcons.back,
                  size: 50.0,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                icon: Icon(Icons.location_city , color: Colors.white,),
                hintText: "Enter a city",
                hintStyle: TextStyle(
                  color: Colors.grey
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none
                ),



              ),
              onChanged: (value){
                city = value;

              },

            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context , city);
                },
                child: Text(
                  "Get weather",
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                )),
          )
        ],
      )),
    );
  }
}
