import 'package:flutter/material.dart';
import 'screens/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'La météo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF1A1423),
        brightness: Brightness.dark,
      ),

      home: HomePage(title: 'Fait-il bon ?'),
    );
  }
}
