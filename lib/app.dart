import 'package:flutter/material.dart';
import 'screens/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Gooly météo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF63B0F8),
        brightness: Brightness.dark,
      ),

      home: HomePage(title: 'Fait-il bon ?'),
    );
  }
}
