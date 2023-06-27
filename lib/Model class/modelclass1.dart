// To parse this JSON data, do
//
//     final currentWeather = currentWeatherFromJson(jsonString);

import 'dart:convert';

/*CurrentWeather currentWeatherFromJson(String str) => CurrentWeather.fromJson(json.decode(str));

String currentWeatherToJson(CurrentWeather data) => json.encode(data.toJson());

class CurrentWeather {
    Location location;
    Current current;

    CurrentWeather({
        required this.location,
        required this.current,
    });

    CurrentWeather copyWith({
        Location? location,
        Current? current,
    }) => 
        CurrentWeather(
            location: location ?? this.location,
            current: current ?? this.current,
        );

    factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
    };
}

class Current {
    int lastUpdatedEpoch;
    String lastUpdated;
    int tempC;
    double tempF;
    int isDay;
    Condition condition;
    double windMph;
    int windKph;
    int windDegree;
    String windDir;
    int pressureMb;
    double pressureIn;
    int precipMm;
    int precipIn;
    int humidity;
    int cloud;
    double feelslikeC;
    double feelslikeF;
    int visKm;
    int visMiles;
    int uv;
    double gustMph;
    double gustKph;
    Map<String, double> airQuality;

    Current({
        required this.lastUpdatedEpoch,
        required this.lastUpdated,
        required this.tempC,
        required this.tempF,
        required this.isDay,
        required this.condition,
        required this.windMph,
        required this.windKph,
        required this.windDegree,
        required this.windDir,
        required this.pressureMb,
        required this.pressureIn,
        required this.precipMm,
        required this.precipIn,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.feelslikeF,
        required this.visKm,
        required this.visMiles,
        required this.uv,
        required this.gustMph,
        required this.gustKph,
        required this.airQuality,
    });

    Current copyWith({
        int? lastUpdatedEpoch,
        String? lastUpdated,
        int? tempC,
        double? tempF,
        int? isDay,
        Condition? condition,
        double? windMph,
        int? windKph,
        int? windDegree,
        String? windDir,
        int? pressureMb,
        double? pressureIn,
        int? precipMm,
        int? precipIn,
        int? humidity,
        int? cloud,
        double? feelslikeC,
        double? feelslikeF,
        int? visKm,
        int? visMiles,
        int? uv,
        double? gustMph,
        double? gustKph,
        Map<String, double>? airQuality,
    }) => 
        Current(
            lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
            lastUpdated: lastUpdated ?? this.lastUpdated,
            tempC: tempC ?? this.tempC,
            tempF: tempF ?? this.tempF,
            isDay: isDay ?? this.isDay,
            condition: condition ?? this.condition,
            windMph: windMph ?? this.windMph,
            windKph: windKph ?? this.windKph,
            windDegree: windDegree ?? this.windDegree,
            windDir: windDir ?? this.windDir,
            pressureMb: pressureMb ?? this.pressureMb,
            pressureIn: pressureIn ?? this.pressureIn,
            precipMm: precipMm ?? this.precipMm,
            precipIn: precipIn ?? this.precipIn,
            humidity: humidity ?? this.humidity,
            cloud: cloud ?? this.cloud,
            feelslikeC: feelslikeC ?? this.feelslikeC,
            feelslikeF: feelslikeF ?? this.feelslikeF,
            visKm: visKm ?? this.visKm,
            visMiles: visMiles ?? this.visMiles,
            uv: uv ?? this.uv,
            gustMph: gustMph ?? this.gustMph,
            gustKph: gustKph ?? this.gustKph,
            airQuality: airQuality ?? this.airQuality,
        );

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"],
        tempF: json["temp_f"]?.toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"],
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"]?.toDouble(),
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"]?.toDouble(),
        feelslikeF: json["feelslike_f"]?.toDouble(),
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        uv: json["uv"],
        gustMph: json["gust_mph"]?.toDouble(),
        gustKph: json["gust_kph"]?.toDouble(),
        airQuality: Map.from(json["air_quality"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "air_quality": Map.from(airQuality).map((k, v) => MapEntry<String, dynamic>(k, v)),
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

class Location {
    String name;
    String region;
    String country;
    double lat;
    double lon;
    String tzId;
    int localtimeEpoch;
    String localtime;

    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    Location copyWith({
        String? name,
        String? region,
        String? country,
        double? lat,
        double? lon,
        String? tzId,
        int? localtimeEpoch,
        String? localtime,
    }) => 
        Location(
            name: name ?? this.name,
            region: region ?? this.region,
            country: country ?? this.country,
            lat: lat ?? this.lat,
            lon: lon ?? this.lon,
            tzId: tzId ?? this.tzId,
            localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
            localtime: localtime ?? this.localtime,
        );

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
    };
}*/


//http://api.weatherapi.com/v1/current.json?key=e12ea569d2714a6482a151348232206&q=London&aqi=yes