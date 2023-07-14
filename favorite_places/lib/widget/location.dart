import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator_platform_interface/src/enums/location_accuracy.dart'
    as acc;
import 'package:geocoding/geocoding.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  // void getUserLocation() {}
  String? _currentAddress;
  Position? _currentPosition;
  bool isLoading = false;
  Widget ? previewContent;


  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];

      print(place);
      // setState(() {
      //   _currentAddress =
      //      '${place.street}, ${place.subLocality},
      //       ${place.subAdministrativeArea}, ${place.postalCode}';
      // });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getCurrentPosition() async {
    setState(() {
      isLoading = true;
    });

    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
            desiredAccuracy: acc.LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });

    setState(() {
      isLoading = false;
    });

    print(_currentPosition!.longitude);
  }
  // void getUserLocation() async {
  // Location location = Location();
  //
  // bool serviceEnabled;
  // PermissionStatus permissionGranted;
  // LocationData locationData;
  //
  // serviceEnabled = await location.serviceEnabled();
  // if (!serviceEnabled) {
  //   serviceEnabled = await location.requestService();
  //   if (!serviceEnabled) {
  //     return;
  //   }
  // }
  //
  // permissionGranted = await location.hasPermission();
  // if (permissionGranted == PermissionStatus.denied) {
  //   permissionGranted = await location.requestPermission();
  //   if (permissionGranted != PermissionStatus.granted) {
  //     return;
  //   }
  // }
  //
  // locationData = await location.getLocation();
  // }

  @override


  Widget build(BuildContext context) {
previewContent = Text("No Location selected yet !",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground));

    if(_currentPosition != null){
      previewContent = FlutterMap(
        options: MapOptions(
          center: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          zoom: 16.2,
        ),
        nonRotatedChildren: [
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
              ),
            ],
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
        ],
      );

    }

    if(isLoading){

     previewContent = CircularProgressIndicator();


    }


    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          height: 200,
          width: double.infinity,
          child: previewContent,
        ),

        //   isLoading
        //       ? CircularProgressIndicator()
        //       : Text("No Location selected yet !",
        //           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        //               color: Theme.of(context).colorScheme.onBackground)),
        // ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentPosition,
              icon: const Icon(Icons.location_on),
              label: const Text("Get current location"),
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.map),
                label: const Text("Select on map!"))
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
