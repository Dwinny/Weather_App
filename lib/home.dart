import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    super.key,
  });

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
                  Text(
                    'Today, June 10th, 2023',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    'Barcelona',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    'Spain',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 93, 166, 201)
                              .withOpacity(0.5),
                          offset: Offset(0, 2),
                          blurRadius: 8,
                          spreadRadius: 1)
                    ]),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            parser.emojify(':cloud with rain:'),
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '10oC',
                            style:
                                TextStyle(color: Colors.black, fontSize: 50.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '7 mph',
                        style: font3(),
                      ),
                      Text(
                        '6.4 miles',
                        style: font3(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('85%', style: font2()),
                      Text(
                        '998 mb',
                        style: font2(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
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
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          daysOftheWeek(
                            'Sunday',
                            '10oC',
                            parser.emojify(':cloud with rain:'),
                          ),
                          daysOftheWeek(
                            'Monday',
                            '8oC',
                            parser.emojify(':cloud with rain and sun:'),
                          ),
                          daysOftheWeek(
                            'Tuesday',
                            '3oC',
                            parser.emojify(':cloud with snow:'),
                          ),
                          daysOftheWeek(
                            'Thursday',
                            '5oC',
                            parser.emojify(':cloud with thunder:'),
                          ),
                          daysOftheWeek(
                            'Friday',
                            '9oC',
                            parser.emojify(':double cloud:'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
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
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    emoji,
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(degree),
                ],
              )),
        )
      ],
    );
  }
}
