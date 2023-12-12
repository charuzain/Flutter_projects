

import 'dart:convert';

import 'package:http/http.dart';

class Networking{

  Uri url;

  Networking(this.url);


  getNetworkData() async {
    Response response = await get(url);
    if(response.statusCode == 200){

      return jsonDecode(response.body);
    }
    else{
      print("Error");
      print(response.statusCode);
    }


  }


}

