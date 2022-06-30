import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color darkGreyClr = Color(0xFF121212);
const primaryClr = bluishClr;

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.lightBlueAccent,
    //color of AppBar
// https://stackoverflow.com/questions/69295173/primarycolor-property-in-themedata-does-not-work-in-flutter#:~:text=With%20the%20newest%20versions%20of,%3A%20ColorScheme(%20primary%3A%20Colors.
    colorScheme: ColorScheme(
        primary: Color(0xFF4e5ae8),
        secondary: Colors.blue,
        error: Colors.yellow,
        onPrimary: Colors.green,
        //color for Icons on AppBar
        surface: Colors.grey,
        onSurface: Colors.red,
        background: Colors.pink,
        onSecondary: Colors.purpleAccent,
        onError: Colors.deepPurple,
        brightness: Brightness.light,
        onBackground: Colors.white54),
  );

  static final dark = ThemeData(
    backgroundColor: Colors.black, //color of AppBar
    colorScheme: ColorScheme(
        primary: Colors.grey,
        secondary: Colors.blue,
        error: Colors.yellow,
        onPrimary: Colors.green,
        surface: Colors.grey,
        onSurface: Colors.red,
        //color for Icons on AppBar
        background: Colors.pink,
        onSecondary: Colors.purpleAccent,
        onError: Colors.deepPurple,
        brightness: Brightness.dark,
        onBackground: Colors.white),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}
