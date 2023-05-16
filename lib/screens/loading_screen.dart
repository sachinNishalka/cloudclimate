import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloudclimate/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloudclimate/services/networking.dart';
import 'package:cloudclimate/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const String apiKey = 'c189a77a850558871c5449884b5d9684';

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
    Location objLocation = Location();
    await objLocation.getLocation();
    // print(objLocation.latitude);
    latitute = objLocation.latitude;
    longitute = objLocation.logitute;

    // print(objLocation.logitute);

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitute&lon=$longitute&appid=$apiKey');

    var whetherdata = await networkHelper.getData();
    
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(),));

    

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
