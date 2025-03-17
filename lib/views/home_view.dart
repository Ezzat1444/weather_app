import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_w_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_w_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherStatus),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }),
              );
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 32,
            ),
            tooltip: 'Search here',
          )
        ],
        title: Text(
          'Waether App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return  NoWeather();
          } else if (state is WeatherLoadedSuccessState) {
           return Weatherinfo(
            weather: state.weatherModel,
           );
          } else {
            return const Text('There was an error');
          }
          
      },
      ),
    );
  }
}
