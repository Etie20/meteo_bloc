import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:meteo_bloc/model/weather.dart';

class ApiService {
  final Position position;
  const ApiService({required this.position});

  //Create url request
  Uri urlRequest() {
    const apiKey = "135cd21863a34286899143722232304";
    const baseUrl ="http://api.weatherapi.com/v1/forecast.json";
    const days = "7";
    const lang = "fr";
    String q = "${position.latitude}, ${position.longitude}";

    String urlString = "$baseUrl?key=$apiKey&q=$q&lang=$lang&days=$days";

    return Uri.parse(urlString);
  }

  //Do api call
  Future<Weather> callAPI() async {
    final result = await http.get(urlRequest());
    final body = json.decode(utf8.decode(result.bodyBytes));
    return Weather.fromJson(body);
  }
}