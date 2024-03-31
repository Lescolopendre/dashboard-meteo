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

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) { //senser s'adapter a la taille ecran
          final containerWidth = constraints.maxWidth;

          return Row(
            children: [
              /* Il prenait trop de place wesh puis pas si utile que ca la verdad
              SizedBox(
                width: 50, // Constrain icon width
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Lottie.asset(
                      "assets/icone/smoke_particles.json",
                      width: 50,
                      height: 50
                  ),
                ),
              ),
              */
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text("Qualité de l'air",
                      style: TextStyle(
                      fontSize: 12, // Taille de la police
                      fontWeight: FontWeight.w300, // Poids de la police
                      fontFamily: 'Roboto', // Famille de police
                      color: Colors.white.withOpacity(0.5), // Couleur du texte
                  ),
                  ),
                  SizedBox(height: 5),
                  Text(
                      hourlyAqi.toList()[0][currentHour].toString() + "   " + addCom,
                    style: TextStyle(
                      fontSize: 15, // Taille de la police
                      fontWeight: FontWeight.bold, // Poids de la police
                      fontFamily: 'Roboto', // Famille de police
                      color: Colors.white, // Couleur du texte
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: containerWidth/1.2,
                    height: 10, // Adjust height as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Round corners
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(0.9),
                          Colors.green.withOpacity(0.9),
                          Colors.yellow.withOpacity(0.9),
                          Colors.orange.withOpacity(0.9),
                          Colors.red.withOpacity(0.9),
                          Colors.purple.withOpacity(0.9),
                        ],
                        stops: [0.0,0.166,0.332,0.498,0.664, 1.0], // Set gradient stops
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: ((hourlyAqi.toList()[0][currentHour]) / 100) * containerWidth/1.2,
                          child: Container(
                            width: 10, // Indicator width
                            height: 10, // Indicator height
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );


        }
    );



  }
}