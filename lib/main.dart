import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_w_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_w_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherStatus),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherStatus) {
  if (weatherStatus == null) {
    return Colors.blue;
  }
  switch (weatherStatus) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
      return Colors.grey;
    case "Patchy rain possible":
    case "Light drizzle":
    case "Light rain":
    case "Moderate rain":
    case "Heavy rain":
    case "Rain showers":
      return Colors.blueGrey;
    case "Patchy snow possible":
    case "Light snow":
    case "Moderate snow":
    case "Heavy snow":
    case "Blizzard":
      return Colors.lightBlue;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple;
    case "Patchy sleet possible":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Ice pellets":
    case "Freezing drizzle":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.cyan;
    default:
      return Colors.deepblue; // Default color
  }
}
