import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/search_screen/view/view.dart';
import 'package:weather_app/features/wether_screen/view/view.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SearchRoute.page, path: "/", initial: true),
        AutoRoute(page: WeatherRoute.page, path: "/weather")
      ];
}
// api key - b5f23e708ce9493bbcd120826232704
