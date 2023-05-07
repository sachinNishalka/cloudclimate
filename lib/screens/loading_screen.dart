import 'package:flutter/material.dart';
import 'package:cloudclimate/services/location.dart';
import 'package:http/http.dart' as http;

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
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations=37.4219983,-122.084&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key=GPUN44XMFT74EYL4DEZ3EZD4B'));
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
