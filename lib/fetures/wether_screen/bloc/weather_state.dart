part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadedState extends WeatherState {
  final WeatherData weatherData;

  WeatherLoadedState({required this.weatherData});
}

final class WeatherLoadingState extends WeatherState {}

final class WeatherLoadingFilatureState extends WeatherState {}
