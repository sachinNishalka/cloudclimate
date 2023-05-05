import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Location {
  late double latitude;
  late double logitute;

  // location getting function
  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      logitute = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  void printLocation() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(52.2165157, 6.9437819);

    print(placemarks);
  }
}
