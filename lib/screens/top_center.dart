import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class TopCenterWidget extends StatelessWidget {
  final weather;

  const TopCenterWidget({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.33,
      width: screenSize.width * 0.475,
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
                itemCount: weather.length,
                itemBuilder: (BuildContext context, int index) {
                  // Obtention du code météo pour cette heure
                  int weatherCode = weather[index];

                  // Calcul de l'heure correspondante
                  int hourValue = (index + 1) % 24;
                  String formattedHour = DateFormat('HH:00')
                      .format(DateTime(2022, 1, 1, hourValue));

                  // Obtention du chemin de l'animation Lottie en fonction du code météo et de l'heure
                  String animationAsset = _getAnimationAsset(weatherCode, hourValue);

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
            ),
          ),
        ],
      ),
    );
  }

  // Fonction pour obtenir le chemin de l'animation Lottie en fonction du code météo et de l'heure
  String _getAnimationAsset(int weatherCode, int hourValue) {
    // Si c'est la nuit (entre 18h et 6h), affiche une icône de lune
    if (hourValue >= 18 || hourValue < 6) {
      switch (weatherCode) {
        case 0:
          return "assets/icone/clear_night.json";
        case 1:
        case 2:
          return "assets/icone/partly_cloudy_night.json";
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
          return "assets/icone/thunderstorm.json";
        default:
          return "assets/icone/clear_day.json"; // Animation par défaut
      }
    } else {
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
          return "assets/icone/thunderstorm.json";
        default:
          return "assets/icone/clear_day.json"; // Animation par défaut
      }
    }
  }
}
