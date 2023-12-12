import 'dart:convert';

import 'package:bmi_calculator/result.dart';
import 'package:bmi_calculator/weatherModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'get_location.dart';
import 'package:http/http.dart';

import 'networking.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  void initState() {
    super.initState();
    getLocationD();
  }
  void getLocationD() async {
    WeatherModel model = WeatherModel();
    var result = await model.getLocationWeather();
    print(result);


    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Result(data: result,);
    }
    ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body:SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )
    );
  }

  // @override
  // void deactivate() {
  //   // TODO: implement deactivate
  //   super.deactivate();
  //   print("destroyed");
  // }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class Location extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('App Title'),
//           backgroundColor: Colors.deepPurple,
//         ),
//         body: InkWell(
//           onTap: () => {},
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               color: Colors.white, // Set the background color to white
//               border: Border.all(color: Colors.blue, width: 2.0),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   Icons.chat,
//                   color: Colors.blue,
//                 ),
//                 SizedBox(width: 8.0),
//                 Text(
//                   'Live Chat',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 16.0,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       );
//
//   }
// }
