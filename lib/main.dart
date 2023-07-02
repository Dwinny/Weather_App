import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/serviceProvider.dart';
import 'home.dart';
import 'search.dart';
import 'constants.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WeatherApp(),
      ),
    ),
  );
}
