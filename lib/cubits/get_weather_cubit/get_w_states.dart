import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedSuccessState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedSuccessState(this.weatherModel);
}

class WeatherFailuerState extends WeatherState {}
