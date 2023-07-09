// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:http/http.dart' as http;
// import 'package:weather_app/Services/service1.dart';

// import '../Model class/modelclass2.dart';
// import 'dart:ui';

// class WeatherProvider extends ChangeNotifier {
//   WeatherData? _weatherData;
//   bool isLoading = false;
//   final FutureData _futureData = FutureData();
//   String errorMessage = '';
//   WeatherData? get weatherData => _weatherData;

//   Future<void> fetchWeatherData() async {
//     try {
//       isLoading = true;
//       _weatherData = await _futureData.getCurData();
//       errorMessage = '';
//       notifyListeners();
//     } catch (e) {
//       isLoading = false;
//       _weatherData = null;
//       errorMessage = 'Failed to fetch weather data';
//       notifyListeners();
//     }
//   }
// }
