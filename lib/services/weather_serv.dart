import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/weather_model.dart';

class API {
  String baseurl = 'http://api.weatherapi.com';
  String APIKey = '7d46fefabbdc414bbe092456231308';
  Future<WeatherModel> getweather({required String CityName}) async {
    Uri URL =
        Uri.parse('$baseurl/v1/forecast.json?key=$APIKey&q=$CityName&days=5');
    http.Response response = await http.get(URL);
    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
