import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app/Services/service1.dart';

import '../Model class/modelclass2.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherData? weatherData;
  bool isLoading = false;
  final FutureData _futureData = FutureData();
  String errorMessage = '';

  Future<void> fetchWeatherData() async {
    try {
      isLoading = true;
      weatherData = await _futureData.getCurData();
      errorMessage = '';
    } catch (e) {
      isLoading = false;
      weatherData = null;
      errorMessage = 'Failed to fetch weather data';
    }
    notifyListeners();
  }
}
