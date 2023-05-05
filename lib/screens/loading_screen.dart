import 'package:flutter/material.dart';
import 'package:cloudclimate/services/location.dart';

Location objLocation = Location();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    objLocation.getLocation();
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
