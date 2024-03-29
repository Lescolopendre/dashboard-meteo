import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/data_pollution.dart';
import 'package:percent_indicator/percent_indicator.dart';

class getPollutionIndicator extends StatelessWidget {
  final Iterable<List<dynamic>> hourlyAqi;
  final currentHour;


  const getPollutionIndicator({super.key,
    required this.hourlyAqi, required this.currentHour,

  });


  @override
  Widget build(BuildContext context) {
    ////////////////////////////////polution level
    var aqiValue= (hourlyAqi.toList()[0][currentHour]);
    var addCom ;
    if (aqiValue >= 0 && aqiValue <= 50) {
      addCom='Good' ;
    } else if (aqiValue > 50 && aqiValue <= 100) {
      addCom='Moderate';
    } else if (aqiValue > 100 && aqiValue <= 150) {
      addCom='Unhealthy for Sensitive Groups';
    } else if (aqiValue > 150 && aqiValue <= 200) {
      addCom='Unhealthy';
    } else if (aqiValue > 200 && aqiValue <= 300) {
      addCom='Very Unhealthy';
    } else if (aqiValue > 300) {
      addCom='Hazardous';
    } else {
      addCom='Unknown';
    }
    //////////////////////////////////////////////

    return Wrap(
      spacing: 1.0, // gap between adjacent chips
      runSpacing: 2.0, // gap between lines
      direction: Axis.vertical,
      children: <Widget>[
        Align(
         alignment:Alignment.topLeft,
          child: Lottie.asset("assets/icone/smoke_particles.json",width: 70,height:70),
       ),
        Text("Qualité de l'air"),
        Text(hourlyAqi.toList()[0][currentHour].toString()+ "   "+ addCom),
        LinearPercentIndicator(
          lineHeight: 5.0,
          width: 20.0,
          percent: (hourlyAqi.toList()[0][currentHour])/100,
          progressColor: Colors.yellow,
          backgroundColor: Colors.grey[300],

        ),
        ],
        );


  }
}