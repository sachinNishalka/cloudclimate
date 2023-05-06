import 'package:geocoding/geocoding.dart';


void main(){
  printLocation();
}


void printLocation() async {
  List<Placemark> placemarks =
  await placemarkFromCoordinates(52.2165157, 6.9437819);

  print(placemarks);
}

// https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations=37.4219983,-122.084&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key=GPUN44XMFT74EYL4DEZ3EZD4B