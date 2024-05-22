import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class Weatherinfobody extends StatelessWidget {
  const Weatherinfobody({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              getThemeColor(weatherModel.condition),
              getThemeColor(weatherModel.condition)[300]!,
              getThemeColor(weatherModel.condition)[100]!,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weatherModel.cityName,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}:${weatherModel.date.second}',
                      style: const TextStyle(fontSize: 22),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network('https:${weatherModel.image!}'),
                        Text(
                          weatherModel.temp.toString(),
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text('Maxtemp: ${weatherModel.maxtemp.round()}'),
                            Text('Mintemp: ${weatherModel.mintemp.round()}')
                          ],
                        )
                      ],
                    ),
                    Text(
                      weatherModel.condition,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          ),
        ));
  }
}
