import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/home.dart';
import 'Model class/modelclass2.dart';
import 'Services/service1.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({super.key});

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    locationWeather();
  }

  Future<WeatherData> getWeather() async {
    var weather = await FutureData().getCurData();
    return weather;
  }

  void locationWeather() async {
    var locationData = await getWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherApp(LocationWeather: locationData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlueAccent, Colors.blueGrey],
          ),
        ),
        child: const Center(
            child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        )),
      ),
    );
  }
}
