import 'package:flutter/material.dart';
import 'package:weather_app/searchdetails.dart';
import 'main.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  final TextEditingController textEditingController = TextEditingController();

  // void navigate(String cityName, context) async {
  //   if (cityName.isNotEmpty) {
  //     await Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       return searchDetails(city: cityName);
  //     }));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String cityName;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.lightBlueAccent, Colors.blueGrey])),
            child: SafeArea(
                child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.cancel))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 30,
                          width: 300,
                          // color: Color.fromARGB(183, 223, 211, 211),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'SEARCH LOCATION',
                                filled: true,
                                fillColor: Color.fromARGB(255, 211, 205, 205),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                            controller: textEditingController,
                            onSubmitted: (value) {
                              cityName = value;
                              // return navigate(
                              //     textEditingController.text, context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ))));
  }
}
