// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

//import '../Model class/modelclass1.dart';
import '../Model class/model3.dart';
import '../Model class/modelclass2.dart';
import 'package:geolocator/geolocator.dart';

class FutureData {
  Future<Position> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
      // latitude = position.latitude;
      // longitude = position.longitude;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<WeatherData> getCurData() async {
    final location = await getCurrentLocation();
    try {
      var url = Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=e12ea569d2714a6482a151348232206&q=${location.longitude},${location.latitude}&days=5&aqi=yes&alerts=no');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var curWeather = weatherDataFromJson(response.body);
        return curWeather;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw (Exception(e.toString()));
    }
  }

  Future<CityData> getCityData(String cityName) async {
    try {
      var url = Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=e12ea569d2714a6482a151348232206&q=$cityName&days=5&aqi=yes&alerts=no');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var getWeather = cityDataFromJson(response.body);
        return getWeather;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw (Exception(e.toString()));
    }
  }
}
