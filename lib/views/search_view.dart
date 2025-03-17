import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_w_cubit.dart';
import 'package:weather_app/main.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel
            ?.weatherStatus),
        title: Text(
          'Search City',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              fillColor: Color(0xff030317),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              labelText: 'Search',
              labelStyle: TextStyle(color: Color(0xff030310)),
              hintText: 'Enter city name',
              suffixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Color(0xff030310)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Color(0xff030310)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
