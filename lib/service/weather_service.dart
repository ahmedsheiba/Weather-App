import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String baseURL = 'https://api.weatherapi.com/v1';
  final String apiKey = '4264372d397145ebb48143812231611';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMassage = e.response?.data['error']['message'] ??
          'oops there was an error, try again later';
      throw Exception(errorMassage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try again later');
    }
  }
}
