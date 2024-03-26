import 'package:flutter/material.dart';
import 'dart:convert';
import '../screens/home_page.dart';
import 'package:weather_icons/weather_icons.dart';

Widget getContentBottomContainers() {
  return Container(
      margin: EdgeInsets.all(0.5),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.all(Radius.circular(10)),
              ),
              height: 85,
              width: double.infinity, // Pour occuper toute la largeur de la colonne
              margin: EdgeInsets.all(3),
              child: Row(
                  children:[
                    Expanded(child:
                    Container( //container des temperature actuel, max , min
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 85,
                      margin: EdgeInsets.all(0.5),
                      child: Column(
                          children:[
                            Expanded(child:
                            Container( //container des temperature actuel
                              decoration: BoxDecoration(
                                color: Color(0xFF07549D).withOpacity(0.1),
                                borderRadius:BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 50,
                              margin: EdgeInsets.all(0.5),
                            ),
                            ),
                            Expanded(child:
                            Container( //container des temperature max et min
                              decoration: BoxDecoration(
                                color: Color(0xFF07549D).withOpacity(0.1),
                                borderRadius:BorderRadius.all(Radius.circular(10)),

                              ),
                              height: 34,
                              margin: EdgeInsets.all(0.5),
                            ),
                            ),
                          ]
                      ),

                    ),
                    ),
                    Expanded(child:
                    Container( //humidite et uv display
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 85,
                      margin: EdgeInsets.all(0.5),

                      child: Column(
                          children:[
                            Expanded(child:
                            Container( //container humidity display
                              decoration: BoxDecoration(
                                color: Color(0xFF07549D).withOpacity(0.1),
                                borderRadius:BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 50,
                              margin: EdgeInsets.all(0.5),
                              child:Row(
                                children: <Widget>[
                                  Icon(WeatherIcons.humidity, color: Colors.blue),
                                  SizedBox(width: 8), // Adding some space between icon and text
                                  //Text((dailySunriseHour.toList()[0]).toString()),,
                                ],
                              ),
                            ),
                            ),
                            Expanded(child:
                            Container( //container uv display
                              decoration: BoxDecoration(
                                color: Color(0xFF07549D).withOpacity(0.1),
                                borderRadius:BorderRadius.all(Radius.circular(10)),

                              ),
                              height: 34,
                              margin: EdgeInsets.all(0.5),
                              child:Row(
                                children: <Widget>[
                                  Icon(WeatherIcons.day_lightning,size: 20,color: Colors.red),
                                  SizedBox(width: 8), // Adding some space between icon and text
                                  //Text((dailySunriseHour.toList()[0]).toString()),
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
                  borderRadius:BorderRadius.all(Radius.circular(10))
              ),
              height: 85,
              width: double.infinity, // Pour occuper toute la largeur de la colonne
              margin: EdgeInsets.symmetric(vertical: 2),
              child: Row(
                  children:[
                    Expanded(child:
                    Container( //ville display
                      decoration: BoxDecoration(
                        color: Color(0xFF07549D).withOpacity(0.1),
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 85,
                      margin: EdgeInsets.all(3),
                    ),
                    ),
                  ]
              ),
            ),
          ]
      )
  );
}
