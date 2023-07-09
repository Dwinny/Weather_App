// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

import 'package:intl/intl.dart';
// ...

String getWeatherConditionEmoji(int conditionCode) {
  switch (conditionCode) {
    case 1000: // Clear
      return '☀️';
    case 1003: // Partly cloudy
      return '🌤️';
    case 1006: // Cloudy
      return '☁️';
    case 1030: // Mist
      return '🌫️';
    case 1063: // Patchy rain possible
    case 1186: // Patchy light rain
      return '🌦️';
    case 1066: // Patchy snow possible
    case 1210: // Patchy light snow
      return '🌨️';
    case 1072: // Patchy sleet possible
    case 1237: // Patchy light sleet
      return '🌧️';
    case 1150: // Patchy freezing drizzle
    case 1153: // Light drizzle
    case 1183: // Light rain
    case 1189: // Moderate rain at times
      return '🌧️';
    case 1192: // Moderate or heavy rain shower
    case 1240: // Moderate or heavy sleet showers
    case 1243: // Moderate or heavy snow showers
      return '⛈️';
    case 1204: // Thundery outbreaks possible
      return '🌩️';
    case 1273: // Heavy rain
      return '🌧️';
    case 1276: // Slight sleet showers
    case 1279: // Light snow showers
      return '🌨️';
    case 1282: // Moderate or heavy snow
      return '❄️';
    default:
      return '';
  }
}

  // ...


// class WeatherForecast {
//   // existing properties and methods...

//   String getFormattedDate(int index) {
//     final DateTime date = DateTime.parse(forcast.forecastday[index].date);
//     final DateFormat formatter = DateFormat('EEEE');
//     final String formattedDate = formatter.format(date);
//     return formattedDate;
//   }
// }