import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double logitute;

  // location getting function
  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      logitute = position.longitude;

      print("Latitude $latitude");
      print("Logiture $logitute");
    } catch (e) {
      print(e);
    }
  }
}
