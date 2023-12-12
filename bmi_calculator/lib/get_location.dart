

import 'package:geolocator/geolocator.dart';

class GetLocation{

  late  double latitude;
  late  double longitude;

  Future <void>  getCurrentLocation() async {
     Position ? position;
     try{
       LocationPermission permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
           desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
     }
     catch (e){
       print(e);
     }


  }




}