import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/places.dart';

class PlaceDetail extends StatefulWidget {
  const PlaceDetail({super.key, required this.place});
  final Place place;

  @override
  State<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text(widget.place.name))),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(width: 3)),
              width: double.infinity,
              height: double.infinity,
              child: Image.file(
                widget.place.image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: CircleAvatar(
                        radius: 96,
                        child: FlutterMap(
                          options: MapOptions(
                            center: LatLng(widget.place.lat, widget.place.long),
                            zoom: 17.2,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.app',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(
                                      widget.place.lat, widget.place.long),
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
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        widget.place.address,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
