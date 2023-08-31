import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/CustomWidgets/Defaultwidget.dart';
import 'package:weatherapp/CustomWidgets/SuccessWidget.dart';

import 'package:weatherapp/pages/searchpage.dart';

import '../Models/weather_model.dart';
import '../cubits/WeatherCubit.dart';
import '../cubits/WeatherState.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, State) {
      if (State is WeatherLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (State is WeatherSuccess) {
        weatherData = BlocProvider.of<WeatherCubit>(context).weathermodel;
        return successwidget(weatherdata: weatherData);
      } else if (State is WeatherFailure) {
        return Center(
          child: Text('something is Wrong'),
        );
      } else {
        return Defaultwidget();
      }
    });
  }
}
