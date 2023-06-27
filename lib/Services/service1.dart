import 'package:http/http.dart' as http;

//import '../Model class/modelclass1.dart';
import '../Model class/modelclass2.dart';

class WeatherData {
  Future<FutureWeather> getCurData() async {
    try {
      var url = Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=e12ea569d2714a6482a151348232206&q=London&days=5&aqi=yes&alerts=no');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var curWeather = futureWeatherFromJson(response.body);
        print(curWeather);
        return curWeather;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw (Exception(e.toString()));
    }
  }
}
