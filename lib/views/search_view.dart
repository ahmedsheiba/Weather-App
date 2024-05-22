import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 30, 2, 59),
          Color.fromARGB(255, 131, 127, 129),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(
              onSubmitted: (value) async {
                var getWeathercubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeathercubit.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                labelText: 'Search City',
                labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'Enter City Name',
                hintStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
