import 'package:flutter/material.dart';

class CurrentHourWidget extends StatefulWidget {
  @override
  CurrentHourWidgetState createState() => CurrentHourWidgetState();
}

class CurrentHourWidgetState extends State<CurrentHourWidget> {
  late int currentHour;


  @override
  void initState() {
    super.initState();
    currentHour = getCurrentHour();
  }

  int getCurrentHour() {
    return DateTime.now().hour;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

  