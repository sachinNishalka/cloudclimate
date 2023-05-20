import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:cloudclimate/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloudclimate/services/weather.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longitute;
  late double latitute;

  @override
  void initState() {
    getLocationData();
  }

  void getLocationData() async {


    dynamic whetherdata = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(weatherData: whetherdata),));

    

  }

  // void getData() async {
  //   http.Response response = await http.get(Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=6.8216&lon=80.04753&appid=c189a77a850558871c5449884b5d9684'),);
  //
  //       if(response.statusCode == 200){
  //         String data = response.body;
  //         // print(data);
  //
  //         var decodeData = jsonDecode(data);
  //
  //         String cityName = decodeData['name'];
  //         double temparature = decodeData['main']['temp'];
  //         String condition = decodeData['weather'][0]['description'];
  //
  //         print(cityName);
  //         print(temparature);
  //         print(condition);
  //
  //       }else{
  //         print(response.statusCode);
  //       }
  // }

  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
