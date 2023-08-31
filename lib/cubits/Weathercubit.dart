import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/Models/weather_model.dart';

import '../services/weather_serv.dart';
import 'WeatherState.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.api) : super(WeatherInitial());
  API api;
  String? cityName;
  WeatherModel? weathermodel;
  void getweather({required String cityname}) async {
    emit(WeatherLoading());
    try {
      weathermodel = await api.getweather(CityName: cityname);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
