import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_w_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class ExtraWeather extends StatelessWidget {
  const ExtraWeather({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(CupertinoIcons.wind,color: Colors.white, size: 30,),
            SizedBox(height: 10),
            Text(
            '${weatherModel.wind.round()}'' %',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18),
              ),
              SizedBox(height: 5),
              Text('Wind',
              style: TextStyle(fontSize: 20,color: Colors.white),
              ),
          ],
        ),
        Column(
          children: [
            Icon(CupertinoIcons.drop,color: Colors.white, size: 30,),
            SizedBox(height: 10),
            Text(
              '${weatherModel.humidity!.round()}'' %',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18),
              ),
              SizedBox(height: 5),
              Text('Humidity',
              style: TextStyle(fontSize: 20,color: Colors.white),
              ),
          ],
        ),
        Column(
          children: [
            Icon(CupertinoIcons.cloud_rain,color: Colors.white, size: 30,),
            SizedBox(height: 10),
            Text('${weatherModel.chanceOfrain.round()}' ' %',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18),
              ),
              SizedBox(height: 5),
              Text('Rain',
              style: TextStyle(fontSize: 20,color: Colors.white),
              ),
          ],
        )

      ],
    );
  
  
  }
}