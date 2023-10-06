import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/router/router.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchSreenState();
}

class _SearchSreenState extends State<SearchScreen> {
  final TextEditingController textFieldController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Weather App")),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(padding: EdgeInsets.all(30)),
          SizedBox(
            width: 400,
            child: Text(
              "Привет! Давай введем место, чтобы узнать погоду!",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
          ),
          const Padding(padding: EdgeInsets.all(30)),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: "Moscow",
                  labelText: "Weather place"),
              controller: textFieldController,
              onChanged: (value) {
                debugPrint(textFieldController.text);
              },
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))))),
                  onPressed: () {
                    if (textFieldController.text.isEmpty) {
                      return;
                    }
                    AutoRouter.of(context)
                        .push(WeatherRoute(place: textFieldController.text));
                  },
                  child: const Text("Узнать погоду")))
        ],
      ),
    );
  }
}
