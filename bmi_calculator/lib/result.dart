import 'package:bmi_calculator/weatherModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'city.dart';

class Result extends StatefulWidget {
  final data;


  Result({Key? key, this.data}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

// state object
class _ResultState extends State<Result> {
  double ? temperature;
  late int condition;
  String ? message;
  String ? city;
  int ? id;
  String ? weatherIcon;
  String ? msg;

  void updateUI(dynamic weatherData){
    setState(() {
    temperature = weatherData['main']['temp'];
    print("temp is ");
    print(temperature);

   id = weatherData['weather'][0]['id'];
    print(id);

    city = weatherData['name'];
    print(city);
    });

  }
  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
    WeatherModel weather =  WeatherModel();
    weatherIcon = weather.getWeatherIcon(id!);
    msg = weather.getMessage(temperature!);

  }


  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
      // appBar: AppBar(title: Text("Weather Result"),),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/location_background.jpg'),
                  fit: BoxFit.cover,


                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          var result =await WeatherModel().getLocationWeather();
                          print(result);
                          updateUI(result);

                        },
                        child: Icon(
                          Icons.screen_share_outlined,
                          size: 50.0,
                        ),
                      ),
                      TextButton(
                        onPressed: ()async {
                         var typedName =  await Navigator.push(context, MaterialPageRoute(builder: (context){
                            return City();
                          }));
                         print("city is ");
                         print(typedName);

                         WeatherModel model = WeatherModel();
                         var res = await model.getCityData(typedName);
                         updateUI(res);
                        },
                        child: Icon(
                          CupertinoIcons.home,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 5.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                         '${temperature?.toInt()}k',
                          style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Text('$weatherIcon' , style: TextStyle(fontSize: 40 , color: Colors.yellowAccent),),

                    ],
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    '$msg in $city !!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
             ),
          ],
        ),
      ),
    );
  }
}




