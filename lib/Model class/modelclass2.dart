// To parse this JSON data, do
//
//     final weatherData = weatherDataFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

WeatherData weatherDataFromJson(String str) =>
    WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

class WeatherData {
  Location location;
  Current current;
  Forecast forecast;

  WeatherData({
    required this.location,
    required this.current,
    required this.forecast,
  });

  WeatherData copyWith({
    Location? location,
    Current? current,
    Forecast? forecast,
  }) =>
      WeatherData(
        location: location ?? this.location,
        current: current ?? this.current,
        forecast: forecast ?? this.forecast,
      );

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
        "forecast": forecast.toJson(),
      };
}

class Current {
  int lastUpdatedEpoch;
  String lastUpdated;
  double tempC;
  Condition condition;
  double windMph;
  double pressureMb;
  int humidity;
  double visMiles;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.condition,
    required this.windMph,
    required this.pressureMb,
    required this.humidity,
    required this.visMiles,
  });

  Current copyWith({
    int? lastUpdatedEpoch,
    String? lastUpdated,
    double? tempC,
    Condition? condition,
    double? windMph,
    double? pressureMb,
    int? humidity,
    double? visMiles,
  }) =>
      Current(
        lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        tempC: tempC ?? this.tempC,
        condition: condition ?? this.condition,
        windMph: windMph ?? this.windMph,
        pressureMb: pressureMb ?? this.pressureMb,
        humidity: humidity ?? this.humidity,
        visMiles: visMiles ?? this.visMiles,
      );

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"]?.toDouble(),
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        pressureMb: json["pressure_mb"]?.toDouble(),
        humidity: json["humidity"],
        visMiles: json["vis_miles"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "pressure_mb": pressureMb,
        "humidity": humidity,
        "vis_miles": visMiles,
      };
}

class Condition {
  String text;
  String icon;
  int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  Condition copyWith({
    String? text,
    String? icon,
    int? code,
  }) =>
      Condition(
        text: text ?? this.text,
        icon: icon ?? this.icon,
        code: code ?? this.code,
      );

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}

class Forecast {
  List<Forecastday> forecastday;

  Forecast({
    required this.forecastday,
  });

  Forecast copyWith({
    List<Forecastday>? forecastday,
  }) =>
      Forecast(
        forecastday: forecastday ?? this.forecastday,
      );

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: List<Forecastday>.from(
            json["forecastday"].map((x) => Forecastday.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
      };
}

class Forecastday {
  String date;
  int dateEpoch;
  Day day;

  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
  });

  Forecastday copyWith({
    String? date,
    int? dateEpoch,
    Day? day,
  }) =>
      Forecastday(
        date: date ?? this.date,
        dateEpoch: dateEpoch ?? this.dateEpoch,
        day: day ?? this.day,
      );

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json["date"],
        dateEpoch: json["date_epoch"],
        day: Day.fromJson(json["day"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "date_epoch": dateEpoch,
        "day": day.toJson(),
      };
}
// String getFormattedDate(int index) {
//     final DateTime date = DateTime.parse(forecastday[index].date);
//     final DateFormat formatter = DateFormat('EEEE');
//     final String formattedDate = formatter.format(date);
//     return formattedDate;
//   }

class Day {
  double maxtempC;
  Condition condition;

  Day({
    required this.maxtempC,
    required this.condition,
  });

  Day copyWith({
    double? maxtempC,
    Condition? condition,
  }) =>
      Day(
        maxtempC: maxtempC ?? this.maxtempC,
        condition: condition ?? this.condition,
      );

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"]?.toDouble(),
        condition: Condition.fromJson(json["condition"]),
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "condition": condition.toJson(),
      };
}

class Location {
  String name;
  String region;
  String country;
  String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  Location copyWith({
    String? name,
    String? region,
    String? country,
    String? localtime,
  }) =>
      Location(
        name: name ?? this.name,
        region: region ?? this.region,
        country: country ?? this.country,
        localtime: localtime ?? this.localtime,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "localtime": localtime,
      };
}
// String getFormattedDate(int index) {
//     final DateTime date = DateTime.parse(forcast.forecastday[index].date);
//     final DateFormat formatter = DateFormat('EEEE');
//     final String formattedDate = formatter.format(date);
//     return formattedDate;
//   }


//http://api.weatherapi.com/v1/forecast.json?key=e12ea569d2714a6482a151348232206&q=London&days=5&aqi=yes&alerts=no