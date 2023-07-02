import 'package:flutter/material.dart';

class daysOftheWeek extends StatelessWidget {
  String day;
  double degree;
  Image emoji;
  daysOftheWeek(this.day, this.degree, this.emoji);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(day, style: TextStyle(color: Colors.black)),
          SizedBox(
            height: 6,
          ),
          Container(
            //padding: EdgeInsets.all(10),
            height: 95,
            width: 60,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      emoji
                      //style: TextStyle(fontSize: 20),
                      ,
                      SizedBox(
                        height: 6,
                      ),
                      Text(degree.toStringAsFixed(0)),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
