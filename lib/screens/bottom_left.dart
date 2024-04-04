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
  final index;
  const getContentBottomContainers({
    super.key,
    required this.hourlyApparentTemp,
    required this.currentHour,
    required this.hourlyWindSpeed,
    required this.hourlyHumidity,
    required this.hourlyUVIndex,
    required this.hourlyAqi, required this.index,
  });

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
                                    padding: EdgeInsets.only(left: 30),
                                    // Add padding to the left
                                    child: Text(
                                      (hourlyApparentTemp.toList()[index][currentHour]).toString() +" °C",
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
                                      (hourlyWindSpeed.toList()[index][currentHour])
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
                            child: Row(
                              children: [
                                Image.asset("assets/humidity.png",height:40,width:40),
                                SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Humidité",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Roboto',
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                    Text(
                                      (hourlyHumidity.toList()[index][currentHour])
                                          .toString() +" %",
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
                                Lottie.asset("assets/icone/uv_index.json",width: 40, height: 40),
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
                                      (hourlyUVIndex.toList()[index][currentHour])
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
              index: index,
              currentHour: currentHour,
              hourlyAqi: hourlyAqi,



            ),
          ),
        ],
      ),
    );
  }
}
