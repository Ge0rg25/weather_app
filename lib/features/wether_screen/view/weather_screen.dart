import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/wether_screen/bloc/weather_bloc.dart';
import 'package:weather_app/repositories/weather/abstract_weather_repository.dart';

@RoutePage()
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.place});
  final String place;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherBloc _bloc = WeatherBloc(GetIt.I<AbstractWeatherRepository>());

  @override
  void initState() {
    _bloc.add(LoadWeatherEvent(place: widget.place));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Weather App")),
        body: RefreshIndicator(
          onRefresh: () async {
            Completer completer = Completer();
            _bloc.add(
                LoadWeatherEvent(completer: completer, place: widget.place));
            return completer.future;
          },
          child: BlocBuilder<WeatherBloc, WeatherState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is WeatherLoadedState) {
                return ListView(
                  children: [
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.all(10)),
                        Image.network(
                          state.weatherData.current.condition.fullIconUrl,
                          fit: BoxFit.fitHeight,
                          height: 300,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.weatherData.location.name,
                              style: theme.textTheme.displayMedium,
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              height: 50,
                              child: Text(
                                "${state.weatherData.current.tempC.toInt()}℃",
                                textAlign: TextAlign.right,
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              } else if (state is WeatherLoadingFilatureState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Something went wrong!\nTry againg later",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleSmall,
                      ),
                      TextButton(
                          onPressed: () =>
                              _bloc.add(LoadWeatherEvent(place: widget.place)),
                          child: const Text("Try again"))
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
