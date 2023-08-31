import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Models/weather_model.dart';
import 'package:weatherapp/cubits/WeatherCubit.dart';

import '../pages/searchpage.dart';

class successwidget extends StatelessWidget {
  successwidget({super.key, required this.weatherdata});
  WeatherModel? weatherdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
      backgroundColor:
          BlocProvider.of<WeatherCubit>(context).weathermodel!.GetThemeColor(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              Text(BlocProvider.of<WeatherCubit>(context).cityName!,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400)),
              Spacer(
                flex: 1,
              ),
              Image.asset(
                BlocProvider.of<WeatherCubit>(context).weathermodel!.GetImage(),
                width: 100,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                BlocProvider.of<WeatherCubit>(context)
                    .weathermodel!
                    .temp!
                    .toInt()
                    .toString(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  BlocProvider.of<WeatherCubit>(context)
                      .weathermodel!
                      .weatherstatename!,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
              SizedBox(
                height: 20,
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                  width: 20,
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  )),
              Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("wind",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "${BlocProvider.of<WeatherCubit>(context).weathermodel!.wind!.toInt().toString()}/${BlocProvider.of<WeatherCubit>(context).weathermodel!.WindDir!}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300)),
                      ],
                    ),
                    Container(
                        height: 20,
                        child: VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        )),
                    Column(
                      children: [
                        Text(
                          'Max Temp',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          BlocProvider.of<WeatherCubit>(context)
                              .weathermodel!
                              .Maxtemp!
                              .toInt()
                              .toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Container(
                        height: 20,
                        child: VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        )),
                    Column(
                      children: [
                        Text(
                          'Min Temp',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          BlocProvider.of<WeatherCubit>(context)
                              .weathermodel!
                              .Mintemp!
                              .toInt()
                              .toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
