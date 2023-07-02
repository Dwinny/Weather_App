import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Model%20class/modelclass2.dart';
import 'package:weather_app/Provider/serviceProvider.dart';
import 'package:weather_app/Services/service1.dart';
import 'package:weather_app/search.dart';
import 'constants.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:geolocator/geolocator.dart';

import 'days.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({
    super.key,
  });

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    getWeatherData = getWeather();
  }

  late Future<WeatherData> getWeatherData;

  Future<WeatherData> getWeather() async {
    var weather = await FutureData().getCurData();
    return weather;
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlueAccent, Colors.blueGrey],
            )),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const searchPage()),
                                );
                              },
                              icon: Icon(Icons.search))),
                    ],
                  ),
                  FutureBuilder(
                    future: getWeatherData,
                    builder: ((
                      context,
                      snapShot,
                    ) {
                      switch (snapShot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                              child: const CircularProgressIndicator());
                        case ConnectionState.done:
                        default:
                          if (snapShot.hasError) {
                            final error = snapShot.error;
                            return Text('$error');
                          } else if (snapShot.hasData) {
                            dynamic data = snapShot.data;
                            return Column(
                              children: [
                                Text(
                                  'Today, ${data.location!.localtime}',
                                  style: TextStyle(
                                      fontSize: 8, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  data.location.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  data.location!.country,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 93, 166, 201)
                                                .withOpacity(0.5),
                                            offset: Offset(0, 2),
                                            blurRadius: 8,
                                            spreadRadius: 1)
                                      ]),
                                  child: CircleAvatar(
                                    radius: 100,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.network(
                                            'https:${data.current!.condition!.icon}',
                                            fit: BoxFit.cover,
                                            //style: TextStyle(fontSize: 50),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            data.current!.tempC is double
                                                ? data.current!.tempC!
                                                    .toStringAsFixed(0)
                                                : data.current!.tempC
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 80.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Wind status',
                                      style: font1(),
                                    ),
                                    Text(
                                      'Visibility',
                                      style: font1(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '${data.current!.windMph is double ? data.current!.windMph.toString() : data.current!.windMph.toString()} mph',
                                      style: font3(),
                                    ),
                                    Text(
                                      '${data.current!.visMiles is double ? data.current!.visMiles.toString() : data.current!.visMiles.toString()} miles',
                                      style: font3(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Humidity',
                                      style: font1(),
                                    ),
                                    Text(
                                      'Air pressure',
                                      style: font1(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                        '${data.current!.humidity is double ? data.current!.humidity.toString() : data.current!.humidity.toString()}%',
                                        style: font2()),
                                    Text(
                                      '${data.current!.pressureMb is double ? data.current!.pressureMb.toStringAsFixed(0) : data.current!.pressureMb.toString()} mb',
                                      style: font2(),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return const Text('No data');
                          }
                      }
                    }),
                  )
                ],
              ),
            ),
          ),
          FutureBuilder(
              future: getWeatherData,
              builder: ((context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: const CircularProgressIndicator());
                  case ConnectionState.done:
                  default:
                    if (snapshot.hasError) {
                      final error = snapshot.error;
                      return Text('$error');
                    } else if (snapshot.hasData) {
                      dynamic data = snapshot.data!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'The Next 5 days',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      daysOftheWeek(
                                          data.forecast!.forecastday[0]!.date,
                                          data.forecast!.forecastday[0]!.day
                                              .maxtempC,
                                          Image.network(
                                            'https:${data.forecast!.forecastday[0]!.day.condition.icon}',
                                            fit: BoxFit.cover,
                                          )),
                                      daysOftheWeek(
                                          data.forecast!.forecastday[1]!.date,
                                          data.forecast!.forecastday[1]!.day
                                              .maxtempC,
                                          Image.network(
                                            'https:${data.forecast!.forecastday[1]!.day.condition.icon}',
                                            fit: BoxFit.contain,
                                          )),
                                      daysOftheWeek(
                                        data.forecast!.forecastday[2]!.date,
                                        data.forecast!.forecastday[2]!.day
                                            .maxtempC,
                                        Image.network(
                                          'https:${data.forecast!.forecastday[2]!.day.condition.icon}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      daysOftheWeek(
                                        data.forecast!.forecastday[3]!.date,
                                        data.forecast!.forecastday[3]!.day
                                            .maxtempC,
                                        Image.network(
                                          'https:${data.forecast!.forecastday[3]!.day.condition.icon}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      daysOftheWeek(
                                        data.forecast!.forecastday[4]!.date,
                                        data.forecast!.forecastday[4]!.day
                                            .maxtempC,
                                        Image.network(
                                          'https:${data.forecast!.forecastday[4]!.day.condition.icon}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Text('No data');
                    }
                }
              }))
        ],
      ),
    );
  }
}
