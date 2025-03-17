import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_w_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/extraweather.dart';

class Weatherinfo extends StatelessWidget {
  const Weatherinfo({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.weatherStatus),
            getThemeColor(weatherModel.weatherStatus)[300]!,
            getThemeColor(weatherModel.weatherStatus)[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: GlowContainer(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 60,
          padding: EdgeInsets.only(top: 10, right: 30, left: 20),
          margin: EdgeInsets.all(0),
          color: getThemeColor(weatherModel.weatherStatus),

          
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(CupertinoIcons.square_grid_2x2, color: Colors.white),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.map_fill,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        weatherModel.cityName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert, color: Colors.white)
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.2, color: Colors.white),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${weatherModel.date.day}:${weatherModel.date.month}:${weatherModel.date.year}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Image.network(
                      'https:${weatherModel.image}',
                      width: 120,
                      height: 120,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
                            GlowText(
                              weatherModel.temp.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              weatherModel.weatherStatus,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.white,
              ),
              SizedBox(height: 10),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Text(
                     'Maxtemp: ${weatherModel.maxtemp.round()}',
                     style: TextStyle(
                       fontSize: 20,
                       color: Colors.white
                     ),
                   ),
                   Text(
                     'Mintemp: ${weatherModel.mintemp.round()}',
                     style: TextStyle(
                       fontSize: 20,
                       color: Colors.white
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 50),

              ExtraWeather(),
            ],
          ),
        ),
        );
  }
}



