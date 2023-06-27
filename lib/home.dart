import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Model%20class/modelclass2.dart';
import 'package:weather_app/Services/service1.dart';
import 'package:weather_app/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Model class/modelclass1.dart';
import 'constants.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

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

  late Future<FutureWeather> getWeatherData;

  Future<FutureWeather> getWeather() async {
    var weather = await WeatherData().getCurData();
    return weather;
  }

  @override
  Widget build(BuildContext context) {
    final parser = EmojiParser();
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
                                      builder: (context) => searchPage()),
                                );
                              },
                              icon: Icon(Icons.search))),
                    ],
                  ),
                  FutureBuilder<FutureWeather>(
                      future: getWeatherData,
                      builder: ((context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(
                                child: const CircularProgressIndicator());
                          case ConnectionState.done:
                          default:
                            if (snapshot.hasError) {
                              final error = snapshot.error;
                              return Text('$error');
                            } else if (snapshot.hasData) {
                              dynamic data = snapshot.data!;
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
                                            Icon(
                                              data.current!.condition!.icon,
                                              size: 50,
                                              //style: TextStyle(fontSize: 50),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              data.current!.tempC is double
                                                  ? data.current!.tempC!
                                                      .toString()
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
                                        '${data.current!.pressureMb is double ? data.current!.pressureMb.toString() : data.current!.pressureMb.toString()} mb',
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
                      })),
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
                                        'Sunday',
                                        '10\u{00B0}C',
                                        '\u{1F327}',
                                      ),
                                      daysOftheWeek(
                                        'Monday',
                                        '8\u{00B0}C',
                                        '\u{1F326}',
                                      ),
                                      daysOftheWeek(
                                        'Tuesday',
                                        '3\u{00B0}C',
                                        '\u{1F328}',
                                      ),
                                      daysOftheWeek(
                                        'Thursday',
                                        '5\u{00B0}C',
                                        '\u{1F329}',
                                      ),
                                      daysOftheWeek(
                                        'Friday',
                                        '9\u{00B0}C',
                                        '\u{2601}\u{FE0F}',
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

class daysOftheWeek extends StatelessWidget {
  String day;
  String degree;
  String emoji;
  daysOftheWeek(this.day, this.degree, this.emoji);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day, style: TextStyle(color: Colors.black)),
        SizedBox(
          height: 6,
        ),
        Container(
          //padding: EdgeInsets.all(10),
          height: 95,
          width: 68,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      emoji,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(degree),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
