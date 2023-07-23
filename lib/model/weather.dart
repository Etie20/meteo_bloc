class Weather {
  Location? location;
  Current? current;
  Forecast? forecast;

  Weather.fromJson(Map<String, dynamic> json):
        location = Location.fromJson(json["location"]),
        current = Current.fromJson(json["current"]),
        forecast = Forecast(json["forecast"])
  ;
}

class Location {
  String? name;
  String? region;
  String? country;

  Location.fromJson(Map<String, dynamic> jsonLocation):
        name = jsonLocation["name"],
        region = jsonLocation["region"],
        country = jsonLocation["country"];
}

class Current {
  Condition? condition;
  double? temperature;
  double? wind;
  String? windDirection;
  double? precipitation;
  int? humidity;
  int? clouds;
  double? feelsLike;
  double? visibility;
  double? uv;

  Current.fromJson(Map<String, dynamic> json):
        temperature = json["temp_c"],
        wind =json["wind_kph"],
        windDirection = json["wind_dir"],
        precipitation = json["precip_mm"],
        humidity = json["humidity"],
        clouds = json["cloud"],
        feelsLike = json["feelslike_c"],
        visibility = json["vis_km"],
        uv = json["uv"],
        condition = Condition.fromJson(json["condition"])
  ;

}

class Condition {
  String? text;
  String? icon;

  Condition.fromJson(Map<String, dynamic> json):
        text = json["text"],
        icon = json["icon"];
}

class Forecast {
  List<ForecastDay?> forecastDay = [];

  Forecast(Map<String, dynamic> json){
    final list = json["forecastday"] as List<dynamic>;
    forecastDay = list.map((d) => ForecastDay.fromJson(d as Map<String, dynamic>)
    ).toList();
  }

}

class ForecastDay {
  String? date;
  Day? day;

  ForecastDay.fromJson(Map<String, dynamic> json):
        date = json["date"],
        day = Day.fromJson(json["day"]);

}

class Day {
  double? maxTemp;
  double? minTemp;
  double? wind;
  double? precipitation;
  double? snow;
  double? visibility;
  double? humidity;
  int? chanceRain;
  int? chanceSnow;
  Condition? condition;
  double? uv;

  Day.fromJson(Map<String, dynamic> json):
        maxTemp = json["maxtemp_c"],
        minTemp = json["mintemp_c"],
        wind = json["maxwind_kph"],
        precipitation = json["totalprecip_mm"],
        snow = json["totalsnow_cm"],
        visibility = json["avgvis_km"],
        humidity = json["avghumidity"],
        chanceRain = json["daily_chance_of_rain"],
        chanceSnow = json["daily_chance_of_snow"],
        condition = Condition.fromJson(json["condition"]),
        uv = json["uv"];

}