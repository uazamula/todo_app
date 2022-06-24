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
        primaryColor: Colors.amberAccent,// blue is by default. for appbar, buttons and other non-text widgets// doesn't work
        brightness: Brightness.light

      ),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        primaryColor: Colors.yellow,// blue is by default. for appbar, buttons and other non-text widgets
          brightness: Brightness.dark

      ),
      home: HomePage(),
    );
  }
}
