import 'package:auto_route/auto_route.dart';
import 'package:weather_app/fetures/wether_screen/view/weather_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes =>
      [AutoRoute(page: WeatherRoute.page, path: "/", initial: true)];
}
// api key - b5f23e708ce9493bbcd120826232704
