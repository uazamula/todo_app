import 'package:flutter/material.dart';
import 'package:goals_app/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
// https://stackoverflow.com/questions/69295173/primarycolor-property-in-themedata-does-not-work-in-flutter#:~:text=With%20the%20newest%20versions%20of,%3A%20ColorScheme(%20primary%3A%20Colors.
        colorScheme: ColorScheme(
            primary: Colors.yellow,
            secondary: Colors.red,
            error: Colors.red,
            onPrimary: Colors.red,
            surface: Colors.red,
            onSurface: Colors.red,
            background: Colors.red,
            onSecondary: Colors.red,
            onError: Colors.red,
            brightness: Brightness.light,
            onBackground: Colors.red),
      ),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
          primaryColor: Colors.yellow,
          // blue is by default. for appbar, buttons and other non-text widgets
          brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}
