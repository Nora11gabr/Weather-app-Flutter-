import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/cubits/WeatherCubit.dart';
import '../Models/weather_model.dart';

import '../services/weather_serv.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  String? cityName;

  static String id = 'searchpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search '),
      ),
      body: Center(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;

                BlocProvider.of<WeatherCubit>(context)
                    .getweather(cityname: cityName!);
                BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                label: Text('search'),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      BlocProvider.of<WeatherCubit>(context)
                          .getweather(cityname: cityName!);
                      BlocProvider.of<WeatherCubit>(context).cityName =
                          cityName;
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                border: OutlineInputBorder(),
                hintText: 'Enter a city',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
