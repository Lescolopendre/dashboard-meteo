import 'package:flutter/material.dart';
import 'dart:convert';
import '../screens/home_page.dart';
import 'package:weather_icons/weather_icons.dart';
import '../models/data_pollution.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../models/pollution_indicator.dart';

class getContentBottomContainers extends StatelessWidget {
  final hourlyApparentTemp;
  final currentHour;
  final hourlyWindSpeed;
  final hourlyHumidity;
  final hourlyUVIndex;
  final hourlyAqi;


  const getContentBottomContainers({super.key,
    required this.hourlyApparentTemp, required this.currentHour,
    required this.hourlyWindSpeed, required this.hourlyHumidity,
    required this.hourlyUVIndex, required this.hourlyAqi,
  });

  //Pollution setup

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children horizontally
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(3),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF07549D).withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: EdgeInsets.all(3),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (hourlyApparentTemp.toList()[0][currentHour]).toString() + " °C",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF07549D).withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: EdgeInsets.all(3),
                            child: Center(
                              child: Text((hourlyWindSpeed.toList()[0][currentHour]).toString() + " km/h"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(3),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF07549D).withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: EdgeInsets.all(3),
                            child: Row(
                              children: <Widget>[
                                Icon(WeatherIcons.humidity, color: Colors.blue.shade100),
                                SizedBox(width: 5),
                                Text((hourlyHumidity.toList()[0][currentHour]).toString() + " %"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF07549D).withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: EdgeInsets.all(3),
                            child: Row(
                              children: <Widget>[
                                Icon(WeatherIcons.day_lightning, size: 20, color: Colors.red),
                                SizedBox(width: 8),
                                Text((hourlyUVIndex.toList()[0][currentHour]).toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Color(0xFF07549D).withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: getPollutionIndicator(currentHour: currentHour, hourlyAqi: hourlyAqi,),
          ),
        ],
      ),
    );


  }
}