import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 212, 238),
    textTheme: const TextTheme(
        displayMedium: TextStyle(fontSize: 42, fontWeight: FontWeight.w600)),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)));
