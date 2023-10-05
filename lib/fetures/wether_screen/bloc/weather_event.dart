part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class LoadWeatherEvent extends WeatherEvent {
  final Completer? completer;

  LoadWeatherEvent({this.completer});
}
