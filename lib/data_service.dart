import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '1a05e939c42c5ff05ecea0e6b9e511f7',
      'units': 'imperial'
    };
//api.openweathermap.org/data/2.5/weather?q={city name}7appid={API Key}
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
