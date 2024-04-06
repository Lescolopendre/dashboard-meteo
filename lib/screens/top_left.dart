import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';


class getContentTopContainers extends StatelessWidget {
  final index;
  final tempMin;
  final tempMax;
  final hourlyTemp;
  final currentHour;
  final dynamic city;
  final dailySunsetHour;
  final dailySunriseHour;
  final weather;
  final  hourlyWeatherCode;

  const getContentTopContainers({
    super.key,
    required this.tempMax,
    required this.tempMin,
    required this.hourlyTemp,
    required this.currentHour,
    required this.city,
    required this.dailySunsetHour,
    required this.dailySunriseHour,
    required this.index,
    required this.weather,
    required this.hourlyWeatherCode,

  });
  // Fonction pour obtenir le chemin de l'animation Lottie en fonction du code météo et de l'heure
  String getAnimationAsset(int weatherCode, int hourly ) {
    // Si c'est la nuit (entre 18h et 6h), affiche une icône de lune
    if (hourly >= 18 || hourly< 6) {
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
    }}

  @override

  Widget build(BuildContext context) {
    return Container(
        //TOP LEFT
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
            //TOP LEFT
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                //PARTIE HAUTE TEMP ICON ACTUEL
                decoration: BoxDecoration(
                  // color: Color(0xFFF5F5F5).withOpacity(0.05),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 85,
                width: double.infinity,
                // Pour occuper toute la largeur de la colonne
                margin: EdgeInsets.all(3),
                child: Row(children: [
                  //ROW DE LA PARTIE HAUTE
                  Expanded(
                    child: Expanded(
                      child: Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //color: Color(0xFF07549D).withOpacity(0.1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  (hourlyTemp.toList()[index][currentHour])
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width:2),
                                Text("°C",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto',
                                    color: Colors.white.withOpacity(0.5)
                                  ),
                                )
                              ],
                            ),
                            Text(
                                getWordAsset(hourlyWeatherCode.toList()[index][currentHour], currentHour),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 10, // Taille de la police
                                fontWeight: FontWeight.w500, // Poids de la police
                                fontFamily: 'Roboto', // Famille de police
                                color: Colors.white, // Couleur du texte
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        //color: Color(0xFF07549D).withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 85,
                      child:  Lottie.asset(getAnimationAsset((hourlyWeatherCode.toList()[index][currentHour]), currentHour), width: 50, height: 50)
                    ),
                  ),
                ]),
              ), //FIN CONTAINER PARTIE HAUTE
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 85,
                  // Pour occuper toute la largeur de la colonne
                  margin: EdgeInsets.all(3),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            //ville display
                            decoration: BoxDecoration(
                              //color: Color(0xFF07549D).withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 85,
                            margin: EdgeInsets.all(3),
                            child: Column(
                              children:[
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text("Min. ",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto',
                                            color: Colors.white.withOpacity(0.9),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width:2),
                                    Column(
                                      children: [
                                        Text((tempMin.toList()[index]).toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width:2),
                                    Column(
                                      children: [
                                        SizedBox(width:2),
                                        Text("°C",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: 'Roboto',
                                            color: Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width:2),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text("Max. ",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto',
                                            color: Colors.white.withOpacity(0.9),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width:2),
                                    Column(
                                      children: [
                                        Text((tempMax.toList()[index]).toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width:2),
                                    Column(
                                      children: [
                                        SizedBox(width:2),
                                        Text("°C",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: 'Roboto',
                                            color: Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),
                        ),
                        Expanded(
                          child: Container(
                            //sunrise et sunset display
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 85,
                            //margin: EdgeInsets.all(3), //a linterieur

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Container(
                                    //sunrise display
                                    decoration: BoxDecoration(
                                      color:
                                          Color(0xFF07549D).withOpacity(0.05),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    height: 50,
                                    margin: EdgeInsets.all(3),
                                    child: Row(
                                      children: <Widget>[
                                        Lottie.asset(
                                            "assets/icone/sunrise.json",
                                            height: 40,
                                            width: 40),
                                        //SizedBox(width:2 ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Levé",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Roboto',
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                            Text(
                                              (DateFormat('HH:mm').format(
                                                  DateTime.parse(
                                                      dailySunriseHour[
                                                          index]))),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    //sunset display
                                    decoration: BoxDecoration(
                                      color:
                                          Color(0xFF07549D).withOpacity(0.05),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    height: 50,
                                    margin: EdgeInsets.all(3),
                                    child: Row(
                                      children: <Widget>[
                                        Lottie.asset("assets/icone/sunset.json",
                                            height: 40, width: 40),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Couché",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Roboto',
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                            Text(
                                              (DateFormat('HH:mm').format(
                                                  DateTime.parse(
                                                      dailySunsetHour[index]))),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ]));
  }
  // Fonction pour obtenir le chemin de l'animation Lottie en fonction du code météo et de l'heure
  String getWordAsset(int weatherCode, int hourly ) {
    // Si c'est la nuit (entre 18h et 6h), affiche une icône de lune
    if (hourly >= 18 || hourly< 6) {
      switch (weatherCode) {
        case 0:
          return "Nuit éclaircie";
        case 1:
        case 2:
          return "Nuit partiellement nuageuse";
        case 3:
          return "Couvert";
        case 45:
        case 48:
          return "Brouillard";
        case 51:
        case 53:
        case 55:
          return "Bruine";
        case 56:
        case 57:
          return "Neige fondue";
        case 61:
        case 63:
        case 65:
          return "Bruine";
        case 66:
        case 67:
          return "Pluie";
        case 71:
        case 73:
        case 75:
          return "Neige";
        case 77:
          return "Neige";
        case 80:
        case 81:
        case 82:
          return "Pluie";
        case 85:
        case 86:
          return "Neige";
        case 95:
        case 96:
        case 99:
          return "Orage";
        default:
          return "Journée dégagée"; // Animation par défaut
      }
    } else {
      switch (weatherCode) {
        case 0:
          return "Journée dégagée";
        case 1:
        case 2:
          return "Partiellement nuageux";
        case 3:
          return "Couvert";
        case 45:
        case 48:
          return "Brouillard";
        case 51:
        case 53:
        case 55:
          return "Bruine";
        case 56:
        case 57:
          return "Neige fondue";
        case 61:
        case 63:
        case 65:
          return "Neige fondue";
        case 66:
        case 67:
          return "Pluie";
        case 71:
        case 73:
        case 75:
          return "Neige";
        case 77:
          return "Neige";
        case 80:
        case 81:
        case 82:
          return "Pluie";
        case 85:
        case 86:
          return "Neige";
        case 95:
        case 96:
        case 99:
          return "Orage";
        default:
          return "Journée ensoleillée"; // Animation par défaut
      }
    }}


  }

