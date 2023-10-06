import 'package:dio/dio.dart';
import 'package:weather_app/repositories/weather/abstract_weather_repository.dart';
import 'package:weather_app/repositories/weather/models/weather_model.dart';

class WeatherRepository implements AbstractWeatherRepository {
  final Dio dio;
  WeatherRepository({required this.dio});

  @override
  Future<WeatherData> getWeather(String place) async {
    final response = await dio.get(
        "https://api.weatherapi.com/v1/current.json?key=b5f23e708ce9493bbcd120826232704&q=$place&aqi=no");
    return WeatherData.fromJson(response.data);
  }
}
