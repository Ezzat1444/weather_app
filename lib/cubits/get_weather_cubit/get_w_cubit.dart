import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_w_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

   WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherService(Dio()).getCurrantWaether(cityName: cityName);
      emit(WeatherLoadedSuccessState(weatherModel!));
    } catch (e) {
      emit(WeatherFailuerState());
    }
  }
}
