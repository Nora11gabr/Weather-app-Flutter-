import 'dart:ffi';

import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(229, 236, 244, .1),
  100: Color.fromRGBO(229, 236, 244, .2),
  200: Color.fromRGBO(229, 236, 244, .3),
  300: Color.fromRGBO(229, 236, 244, .4),
  400: Color.fromRGBO(229, 236, 244, .5),
  500: Color.fromRGBO(229, 236, 244, .6),
  600: Color.fromRGBO(229, 236, 244, .7),
  700: Color.fromRGBO(229, 236, 244, .8),
  800: Color.fromRGBO(229, 236, 244, .9),
  900: Color.fromRGBO(229, 236, 244, 1),
};

MaterialColor colorCustom = MaterialColor(0xFFe2ebf2, color);

class WeatherModel {
  DateTime? date;
  double? temp;
  double? Maxtemp;
  double? Mintemp;
  String? weatherstatename;
  double? wind;
  String? WindDir;
  String? sunrise;
  String? sunset;
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.Maxtemp,
      required this.Mintemp,
      required this.weatherstatename,
      required this.wind,
      required this.WindDir,
      required this.sunrise,
      required this.sunset});
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data["current"]["last_updated"]),
        temp: jsonData["avgtemp_c"],
        Maxtemp: jsonData["maxtemp_c"],
        Mintemp: jsonData["mintemp_c"],
        weatherstatename: jsonData["condition"]["text"],
        wind: jsonData["maxwind_mph"],
        WindDir: data['forecast']['forecastday'][0]["hour"][0]["wind_dir"],
        sunrise: data['forecast']['forecastday'][0]["astro"]["sunrise"],
        sunset: data['forecast']['forecastday'][0]["astro"]["sunset"]);
  }
  @override
  String toString() {
    return 'temp = $temp  minTemp = $Mintemp maxTemp = $Maxtemp date = $date wind=$wind';
  }

  String GetImage() {
    if (weatherstatename == 'Clear') {
      return 'assets/images/sun.png';
    } else if (weatherstatename == 'Cloudy' ||
        weatherstatename == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherstatename == 'Snow') {
      return 'assets/images/snow.png';
    } else if (weatherstatename == 'Rainy' ||
        weatherstatename == 'Patchy rain possible' ||
        weatherstatename == 'Moderate rain' ||
        weatherstatename == 'Heavy rain') {
      return 'assets/images/rain.png';
    } else if (weatherstatename == 'Thunderstorm') {
      return 'assets/images/thunder.jpeg';
    } else {
      return 'assets/images/sun.png';
    }
  }

  MaterialColor GetThemeColor() {
    if (weatherstatename == 'Clear') {
      return colorCustom;
    } else if (weatherstatename == 'Cloudy' ||
        weatherstatename == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherstatename == 'Snow') {
      return Colors.blue;
    } else if (weatherstatename == 'Rainy' ||
        weatherstatename == 'Patchy rain possible' ||
        weatherstatename == 'Moderate rain' ||
        weatherstatename == 'Heavy rain') {
      return Colors.lightBlue;
    } else if (weatherstatename == 'Thunderstorm') {
      return Colors.grey;
    } else {
      return colorCustom;
    }
  }
}
