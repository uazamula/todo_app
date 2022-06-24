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
