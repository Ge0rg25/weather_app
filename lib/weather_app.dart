import 'package:flutter/material.dart';
import 'package:weather_app/router/router.dart';
import 'package:weather_app/theme/theme.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather Today',
      theme: lightTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
