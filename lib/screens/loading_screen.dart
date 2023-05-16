import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloudclimate/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



  @override
  void initState() {
    getLocation();
  }

  void getLocation() async {
    Location objLocation = Location();
    await objLocation.getLocation();
    print(objLocation.latitude);
    print(objLocation.logitute);

  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations=37.4219983,-122.084&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key=GPUN44XMFT74EYL4DEZ3EZD4B'),);

        if(response.statusCode == 200){
          String data = response.body;
          // print(data);

          var decodeData = jsonDecode(data);

          String cityName = decodeData['locations']['37.4219983,-122.084']['tz'];
          double temparature = decodeData['locations']['37.4219983,-122.084']['values'][1]['temp'];
          String condition = decodeData['locations']['37.4219983,-122.084']['values'][0]['conditions'];

          print(cityName);
          print(temparature);
          print(condition);

        }else{
          print(response.statusCode);
        }
  }

  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
