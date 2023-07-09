// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:ui';

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

  Future<WeatherData> getCityData(String cityName) async {
    try {
      var url = Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=e12ea569d2714a6482a151348232206&q=$cityName&days=5&aqi=yes&alerts=no');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var getWeather = weatherDataFromJson(response.body);
        return getWeather;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw (Exception(e.toString()));
    }
  }

  String getWeatherConditionEmoji(int conditionCode) {
    switch (conditionCode) {
      case 1000: // Clear
        return '☀️';
      case 1003: // Partly cloudy
        return '🌤️';
      case 1006: // Cloudy
        return '☁️';
      case 1030: // Mist
        return '🌫️';
      case 1063: // Patchy rain possible
      case 1186: // Patchy light rain
        return '🌦️';
      case 1066: // Patchy snow possible
      case 1210: // Patchy light snow
        return '🌨️';
      case 1072: // Patchy sleet possible
      case 1237: // Patchy light sleet
        return '🌧️';
      case 1150: // Patchy freezing drizzle
      case 1153: // Light drizzle
      case 1183: // Light rain
      case 1189: // Moderate rain at times
        return '🌧️';
      case 1192: // Moderate or heavy rain shower
      case 1240: // Moderate or heavy sleet showers
      case 1243: // Moderate or heavy snow showers
        return '⛈️';
      case 1204: // Thundery outbreaks possible
        return '🌩️';
      case 1273: // Heavy rain
        return '🌧️';
      case 1276: // Slight sleet showers
      case 1279: // Light snow showers
        return '🌨️';
      case 1282: // Moderate or heavy snow
        return '❄️';
      default:
        return '';
    }
  }
}
