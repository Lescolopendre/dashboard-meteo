import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class topCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
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
          Expanded(
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 24, // 24 heures dans une journée
                itemBuilder: (BuildContext context, int index) {
                  // Calcul de l'heure correspondante
                  int hourValue = (index + 1) % 24; // Pour commencer à 1h et aller jusqu'à 00h
                  String formattedHour = DateFormat('HH:00').format(DateTime(2022, 1, 1, hourValue)); // Format HH:00

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset("assets/icone/clear_day.json", width: 100, height: 100),
                        SizedBox(height: 10), // Espacement entre l'animation et l'heure
                        Text(formattedHour), // Affiche l'heure correspondante
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
