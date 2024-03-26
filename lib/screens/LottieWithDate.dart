import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class LottieWithDateHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return                             Container(
      height: screenSize.height * 0.33,
      width: screenSize.width * 0.475, // Augmentation de la largeur à 0.5
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFFF5F5F5).withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset("assets/icone/clear_night.json", width: 100, height: 100),
              Lottie.asset("assets/icone/sunrise.json", width: 100, height: 100),
              Lottie.asset("assets/icone/sunrise.json", width: 100, height: 100),
              Lottie.asset("assets/icone/sunrise.json", width: 100, height: 100),
              Lottie.asset("assets/icone/sunrise.json", width: 100, height: 100),
              Lottie.asset("assets/icone/sunrise.json", width: 100, height: 100),
              // Ajoutez autant d'animations Lottie que vous le souhaitez ici
            ],
          ),
          SizedBox(height: 10), // Espacement entre les animations et les dates
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(DateTime.now().add(Duration(days: 1)).toString().substring(0, 10)), // Date à J+1
              Text(DateTime.now().add(Duration(days: 2)).toString().substring(0, 10)), // Date à J+2
              Text(DateTime.now().add(Duration(days: 3)).toString().substring(0, 10)), // Date à J+3
              Text(DateTime.now().add(Duration(days: 4)).toString().substring(0, 10)), // Date à J+4
              Text(DateTime.now().add(Duration(days: 5)).toString().substring(0, 10)), // Date à J+5
              Text(DateTime.now().add(Duration(days: 6)).toString().substring(0, 10)), // Date à J+6
              // Ajoutez autant de dates que vous le souhaitez ici
            ],
          ),
        ],
      ),
    );
  }
}
