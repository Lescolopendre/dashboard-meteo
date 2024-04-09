import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class TopCenterWidget extends StatelessWidget {
  final List<dynamic> weather;
  final BoxConstraints boxConstraints;
  final bool isExpanded;

  const TopCenterWidget({Key? key, required this.weather, required this.boxConstraints, required this.isExpanded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtention de l'heure actuelle
    DateTime now = DateTime.now();
    int currentHour = now.hour;

    // Calcul de la largeur en fonction de l'état d'expansion
    double width = isExpanded ? MediaQuery.of(context).size.width * 0.685 : boxConstraints.maxWidth * 0.5;

    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      width: width, // Utilisation de la largeur calculée
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFFF5F5F5).withOpacity(0.1),
      ),
      child: PageView.builder(
        controller: PageController(
          initialPage: currentHour,
          viewportFraction: 0.2, // Réduire l'espace entre chaque heure
        ),
        itemCount: 24,
        itemBuilder: (context, index) {
          // Calcul de l'heure correspondante
          int hourValue = (index + 24) % 24; // Gestion des heures négatives
          String formattedHour = DateFormat('HH:00').format(DateTime(2022, 1, 1, hourValue));

          // Obtention du code météo pour cette heure
          int weatherCode = weather[hourValue];

          // Obtention du chemin de l'animation Lottie en fonction du code météo
          String animationAsset = getAnimationAsset(weatherCode);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(animationAsset, width: 100, height: 100),
                SizedBox(height: 10),
                Text(formattedHour),
              ],
            ),
          );
        },
      ),
    );
  }

  // Fonction pour obtenir le chemin de l'animation Lottie en fonction du code météo
  String getAnimationAsset(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return "assets/icone/clear_day.json";
      case 1:
      case 2:
        return "assets/icone/partly_cloudy_day.json";
      case 3:
        return "assets/icone/overcast.json";
      case 45:
      case 48:
        return "assets/icone/fog.json";
      case 51:
      case 53:
      case 55:
        return "assets/icone/drizzle.json";
      case 56:
      case 57:
        return "assets/icone/sleet.json";
      case 61:
      case 63:
      case 65:
        return "assets/icone/drizzle.json";
      case 66:
      case 67:
        return "assets/icone/rain.json";
      case 71:
      case 73:
      case 75:
        return "assets/icone/snow.json";
      case 77:
        return "assets/icone/snow.json";
      case 80:
      case 81:
      case 82:
        return "assets/icone/rain.json";
      case 85:
      case 86:
        return "assets/icone/snow.json";
      case 95:
      case 96:
      case 99:
        return "assets/icone/thunderstorms.json";
      default:
        return "assets/icone/default_animation.json"; // Animation par défaut
    }
  }
}
