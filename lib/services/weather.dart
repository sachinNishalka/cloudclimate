import 'package:cloudclimate/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloudclimate/services/networking.dart';

const String apiKey = 'your API Key Here';
const String openWeatherApi = 'https://api.openweathermap.org/data/2.5/weather';

const String openCityWeatherApi = 'https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}';


class WeatherModel {

  late double longitute;
  late double latitute;



  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherApi?q=$cityName&appid=$apiKey&units=metric';
    var weatherData = await NetworkHelper(url).getData();
    return weatherData;
  }


  Future <dynamic> getLocationWeather() async{

    Location objLocation = Location();
    await objLocation.getLocation();
    // print(objLocation.latitude);
    latitute = objLocation.latitude;
    longitute = objLocation.logitute;

    // print(objLocation.logitute);

    NetworkHelper networkHelper = NetworkHelper('$openWeatherApi?lat=$latitute&lon=$longitute&appid=$apiKey&units=metric');



    var whetherdata = await networkHelper.getData();
    return whetherdata;
  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
