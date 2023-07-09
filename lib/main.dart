import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/serviceProvider.dart';
import 'home.dart';
import 'loadingscreen.dart';
import 'search.dart';
import 'constants.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loadingScreen(),
    ),
  );
}
