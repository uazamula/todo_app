import 'package:flutter/material.dart';
const Color bluishClr = Color(0xFF4e5ae8);
const Color darkGreyClr = Color(0xFF121212);
const primaryClr = bluishClr;
class Themes{

  static final light = ThemeData(
// https://stackoverflow.com/questions/69295173/primarycolor-property-in-themedata-does-not-work-in-flutter#:~:text=With%20the%20newest%20versions%20of,%3A%20ColorScheme(%20primary%3A%20Colors.
    colorScheme: ColorScheme(
        primary: Color(0xFF4e5ae8),
        secondary: Colors.blue,
        error: Colors.yellow,
        onPrimary: Colors.green,
        surface: Colors.grey,
        onSurface: Colors.red,
        background: Colors.pink,
        onSecondary: Colors.purpleAccent,
        onError: Colors.deepPurple,
        brightness: Brightness.light,
        onBackground: Colors.white54),
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme(
        primary: Colors.black,
        secondary: Colors.blue,
        error: Colors.yellow,
        onPrimary: Colors.green,
        surface: Colors.grey,
        onSurface: Colors.red,
        background: Colors.pink,
        onSecondary: Colors.purpleAccent,
        onError: Colors.deepPurple,
        brightness: Brightness.dark,
        onBackground: Colors.white),
  );

}