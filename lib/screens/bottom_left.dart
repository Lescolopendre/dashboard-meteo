import 'package:flutter/material.dart';
import 'dart:convert';
import '../screens/home_page.dart';
import 'package:weather_icons/weather_icons.dart';
import '../models/data_pollution.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../models/pollution_indicator.dart';
import 'package:lottie/lottie.dart';

class getContentBottomContainers extends StatelessWidget {
  final hourlyApparentTemp;
  final currentHour;
  final hourlyWindSpeed;
  final hourlyHumidity;
  final hourlyUVIndex;
  final hourlyAqi;

  const getContentBottomContainers({
    super.key,
    required this.hourlyApparentTemp,
    required this.currentHour,
    required this.hourlyWindSpeed,
    required this.hourlyHumidity,
    required this.hourlyUVIndex,
    required this.hourlyAqi,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // Stretch children horizontally
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
                              color: Color(0xFF07549D).withOpacity(0.05),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: EdgeInsets.all(3),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // Align children to the start (left) horizontally
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Temp apparente",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Roboto',
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    // Add padding to the left
                                    child: Text(
                                      (hourlyApparentTemp.toList()[0]
                                                  [currentHour])
                                              .toString() +
                                          " °C",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
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
                              color: Color(0xFF07549D).withOpacity(0.05),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: EdgeInsets.all(3),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    // Add padding to the left
                                    child: Text(
                                      "Vent",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Roboto',
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    // Add padding to the left
                                    child: Text(
                                      (hourlyWindSpeed.toList()[0][currentHour])
                                              .toString() +
                                          " km/h",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                              color: Color(0xFF07549D).withOpacity(0.05),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: EdgeInsets.all(3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Icon(WeatherIcons.humidity,
                                        size: 15, color: Colors.blue),
                                    SizedBox(width: 5),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      // Add padding to the left
                                      child: Text(
                                        "Humidité",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Roboto',
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    /*Lottie.asset(
                                          "assets/wind.png",
                                          height:50,
                                          width:50
                                      ),*/
                                    Text(
                                      (hourlyHumidity.toList()[0][currentHour])
                                              .toString() +
                                          " %",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
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
                            decoration: BoxDecoration(
                              color: Color(0xFF07549D).withOpacity(0.05),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                Lottie.asset("assets/icone/uv_index.json",
                                    width: 50, height: 50),
                                SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Index UV",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Roboto',
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                    Text(
                                      (hourlyUVIndex.toList()[0][currentHour])
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
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
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Color(0xFF07549D).withOpacity(0.05),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: getPollutionIndicator(
              currentHour: currentHour,
              hourlyAqi: hourlyAqi,
            ),
          ),
        ],
      ),
    );
  }
}
