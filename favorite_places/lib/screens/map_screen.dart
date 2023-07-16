import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/places.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.place});
  final Place place;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.address),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(widget.place.lat, widget.place.long),
              zoom: 17.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(widget.place.lat, widget.place.long),
                    width: 80,
                    height: 80,
                    builder: (context) => Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
