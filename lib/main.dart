import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/pages/HomePage.dart';
import 'package:weatherapp/pages/searchpage.dart';
import 'package:weatherapp/services/weather_serv.dart';

import 'cubits/WeatherCubit.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(API());
      },
      child: MYAPP()));
}

class MYAPP extends StatelessWidget {
  MYAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
