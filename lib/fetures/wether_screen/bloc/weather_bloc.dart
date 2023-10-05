import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/repositories/weather/abstract_weather_repository.dart';
import 'package:weather_app/repositories/weather/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<LoadWeatherEvent>(_load);
  }

  final AbstractWeatherRepository weatherRepository;

  Future<void> _load(LoadWeatherEvent event, Emitter<WeatherState> emit) async {
    if (state is! WeatherLoadedState) {
      emit(WeatherLoadingState());
    }

    try {
      final weather = await weatherRepository.getWeather("Izhevsk");
      debugPrint(weather.current.condition.text);
      emit(WeatherLoadedState(weatherData: weather));
    } catch (er) {
      debugPrint(er.toString());
      emit(WeatherLoadingFilatureState());
    } finally {
      event.completer?.complete();
    }
  }
}
