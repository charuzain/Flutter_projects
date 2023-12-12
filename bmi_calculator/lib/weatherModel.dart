
import 'get_location.dart';
import 'networking.dart';

class WeatherModel{


  Future<dynamic> getCityData(String cityName)async{
    Networking networkData = Networking(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=98d75c43a8291243b8bafe7a82117ca5'));
    var output = await networkData.getNetworkData();
    print("kjjbd");
    print(output);
    return output;
  }

  Future<dynamic> getLocationWeather() async {
    GetLocation loc = GetLocation();
    await loc.getCurrentLocation();
    Networking networkData = Networking(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=98d75c43a8291243b8bafe7a82117ca5'));
   var result =  await networkData.getNetworkData();
   return result;
  }


String getWeatherIcon(int condition){
  if(condition < 300){
    return '☁️';
  }
  else if(condition < 400){
    return '🌧';
  }
  else if(condition < 500){
    return '🌦';
  }
  else if(condition < 600){
    return '☃️';
  }
  else if(condition < 800){
    return '🥶';
  }
  else if(condition == 800){
    return '🌞';
  }
  else if(condition < 900){
    return '💨';
  }

  else{
    return '🤷‍';
  }
}

String getMessage(double temp){
  if(temp < 100){
    return 'Itd ☕️ Time';
  }
  else if(temp < 200){
    return 'Its 🍜 Time';
  }
  else if(temp < 300){
    return 'Its 🍧🍦 Time';
  }
  else if(temp < 300){
    return 'Its ⛹️ Time';
  }
  else{
    return ' Watch some tv 📺';
  }
}

}