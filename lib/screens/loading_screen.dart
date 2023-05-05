import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// location getting function
void getLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  print(position);
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
