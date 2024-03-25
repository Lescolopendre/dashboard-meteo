import 'package:flutter/material.dart';
import 'dart:convert';
import '../screens/home_page.dart';
import '../models/get_data.dart';
import 'package:weather_icons/weather_icons.dart';

class getContentTopContainers extends StatelessWidget {
  final tempMin;
  final tempMax;
  final tempCurrent;

  const getContentTopContainers({super.key, required this.tempMax, required this.tempMin, required this.tempCurrent});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              // color: Color(0xFFF5F5F5).withOpacity(0.05),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 85,
            width: double.infinity,
            // Pour occuper toute la largeur de la colonne
            margin: EdgeInsets.all(3),
            child: Row(children: [
              Expanded(
                child: Container(
                  //container des temperature actuel, max , min
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  height: 85,
                  margin: EdgeInsets.all(0.5),
                  child: Column(children: [
                    Expanded(
                      child: Container(
                        //container des temperature actuel
                        decoration: BoxDecoration(
                          color: Color(0xFF07549D).withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 50,
                        margin: EdgeInsets.all(0.5),
                        child: Text(tempCurrent.toString()+"°C")
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //container des temperature max et min
                        decoration: BoxDecoration(
                          color: Color(0xFF07549D).withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 34,
                        margin: EdgeInsets.all(0.5),
                        child: Text("min "+ tempMin.toString()[1] +" / max "+ tempMax.toString()[10]+"°C"),
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                child: Container(
                  //icon meteo actuel
                  decoration: BoxDecoration(
                    color: Color(0xFF07549D).withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  height: 85,
                  margin: EdgeInsets.all(0.5),
                ),
              ),
            ]),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 85,
            width: double.infinity,
            // Pour occuper toute la largeur de la colonne
            margin: EdgeInsets.symmetric(vertical: 2),
            child: Row(children: [
              Expanded(
                child: Container(
                  //ville display
                  decoration: BoxDecoration(
                    color: Color(0xFF07549D).withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  height: 85,
                  margin: EdgeInsets.all(0.5),
                ),
              ),
              Expanded(
                child: Container(
                  //sunrise et sunset display
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  height: 85,
                  margin: EdgeInsets.all(0.5),

                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          //sunrise display
                          decoration: BoxDecoration(
                            color: Color(0xFF07549D).withOpacity(0.1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: 41.5,
                          margin: EdgeInsets.all(0.5),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          //sunset display
                          decoration: BoxDecoration(
                            color: Color(0xFF07549D).withOpacity(0.1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: 41.5,
                          margin: EdgeInsets.all(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ]));
  }
}
