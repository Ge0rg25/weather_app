part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class LoadWeatherEvent extends WeatherEvent {
  final Completer? completer;
  final String place;
  LoadWeatherEvent({this.completer, required this.place});
}
