import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import '../models/data_pollution.dart';
import 'package:percent_indicator/percent_indicator.dart';

class getPollutionIndicator extends StatelessWidget {
  final Iterable<List<dynamic>> hourlyAqi;
  final currentHour;

  const getPollutionIndicator({super.key,
    required this.hourlyAqi, required this.currentHour
  });


  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      center:Text( (hourlyAqi.toList()[0][currentHour]).toString()
    +"/800" ,
        style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: Colors.black),
      ),
      lineHeight: 10.0,
      percent: (hourlyAqi.toList()[0][currentHour])/100,
      //barRadius: true,
      //progressColor: getColorAqi(),
      backgroundColor: Colors.grey[300],
    );
  }
}