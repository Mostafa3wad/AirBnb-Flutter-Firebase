import 'package:flutter/material.dart';

ThemeData themeApp() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      useMaterial3: true,
      textTheme: const TextTheme(
        headlineSmall: TextStyle(fontSize: 12.0, color: Colors.black),
        headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(
            fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(fontSize: 10.0, color: Colors.grey),
        labelMedium: TextStyle(fontSize: 12.0, color: Colors.grey),
        displayMedium: TextStyle(fontSize: 20.0, color: Colors.white),
        //for Buttons
        displaySmall: TextStyle(fontSize: 10.0, color: Colors.black),
        displayLarge: TextStyle(
            fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w500),

        bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black),
        // for Text Button

        titleMedium: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.red, fontSize: 12.0),
      ));
}
