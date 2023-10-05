import 'package:weather_app/repositories/weather/models/weather_model.dart';

abstract class AbstractWeatherRepository {
  Future<WeatherData> getWeather(String place);
}
