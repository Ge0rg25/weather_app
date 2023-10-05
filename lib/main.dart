import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/repositories/weather/abstract_weather_repository.dart';
import 'package:weather_app/repositories/weather/weather_repository.dart';
import 'package:weather_app/weather_app.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractWeatherRepository>(
      () => WeatherRepository(dio: Dio()));

  runApp(const WeatherApp());
}
