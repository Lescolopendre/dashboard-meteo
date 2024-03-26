import 'package:flutter/material.dart';
import 'dart:convert';
import '../screens/home_page.dart';
import 'package:weather_icons/weather_icons.dart';
import '../models/air_quality.dart';

class getContentBottomContainers extends StatelessWidget {
  final hourlyApparentTemp;
  final currentHour;
  final hourlyWindSpeed;
  final hourlyHumidity;
  final hourlyUVIndex;

  const getContentBottomContainers({super.key,
    required this.hourlyApparentTemp, required this.currentHour,
    required this.hourlyWindSpeed, required this.hourlyHumidity,
    required this.hourlyUVIndex
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 85,
                width: double.infinity,
                // Pour occuper toute la largeur de la colonne
                margin: EdgeInsets.all(3),
                child: Row(
                    children: [
                      Expanded(child:
                      Container( //container temp apparente et wind speed
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 85,
                        margin: EdgeInsets.all(0.5),
                        child: Column(
                            children: [
                              Expanded(child:
                              Container( //container des temperature apparente
                                  decoration: BoxDecoration(
                                    color: Color(0xFF07549D).withOpacity(0.1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  height: 50,
                                  margin: EdgeInsets.all(0.5),
                                  child:
                                      //ajouter titre et icone
                                  Text((hourlyApparentTemp
                                      .toList()[0][currentHour]).toString() +
                                      " °C")

                              ),
                              ),
                              Expanded(child:
                              Container( //container wind speed
                                decoration: BoxDecoration(
                                  color: Color(0xFF07549D).withOpacity(0.1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                height: 34,
                                margin: EdgeInsets.all(0.5),
                                child:
                                    //ajout titre et icon vitesse vent
                                  Text((hourlyWindSpeed.toList()[0][currentHour]).toString()+"km/h")
                              ),
                              ),
                            ]
                        ),

                      ),
                      ),
                      Expanded(child:
                      Container( //humidite et uv display
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 85,
                        margin: EdgeInsets.all(0.5),
                        child: Column(
                            children: [
                              Expanded(child:
                              Container( //container humidity display
                                decoration: BoxDecoration(
                                  color: Color(0xFF07549D).withOpacity(0.1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                height: 50,
                                margin: EdgeInsets.all(0.5),
                                child: Row(
                                  children: <Widget>[
                                    Icon(WeatherIcons.humidity,
                                        color: Colors.blue.shade100),
                                    SizedBox(width: 5),
                                    Text((hourlyHumidity.toList()[0][currentHour]).toString()+" %"),
                                  ],
                                ),
                              ),
                              ),
                              Expanded(child:
                              Container( //container uv display
                                decoration: BoxDecoration(
                                  color: Color(0xFF07549D).withOpacity(0.1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),

                                ),
                                height: 34,
                                margin: EdgeInsets.all(0.5),
                                child: Row(
                                  children: <Widget>[
                                    Icon(WeatherIcons.day_lightning, size: 20,
                                        color: Colors.red),
                                    SizedBox(width: 8),
                                    Text((hourlyUVIndex.toList()[0][currentHour]).toString()),
                                  ],
                                ),
                              ),
                              ),
                            ]
                        ),
                      ),
                      ),
                    ]
                ),


              ),
              Container( //pollution display
                decoration: BoxDecoration(
                    color: Color(0xFF07549D).withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                height: 85,
                width: double.infinity,
                margin: EdgeInsets.all(3),

              ),
            ]
        )
    );
  }
}