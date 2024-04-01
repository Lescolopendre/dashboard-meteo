import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:intl/intl.dart';
import '../screens/top_center.dart';

class getContentTopContainers extends StatelessWidget {
  final index;
  final tempMin;
  final tempMax;
  final hourlyTemp;
  final currentHour;
  final dynamic city;
  final dailySunsetHour;
  final dailySunriseHour;
  final dynamic weatherCode;
  final dynamic hourValue;

  const getContentTopContainers({
    super.key,
    required this.tempMax,
    required this.tempMin,
    required this.hourlyTemp,
    required this.currentHour,
    required this.city,
    required this.dailySunsetHour,
    required this.dailySunriseHour, required this.index,
    required this.dailySunriseHour,
    required this.hourValue,
    required this.weatherCode
  });

  @override
  Widget build(BuildContext context) {
    return Container( //TOP LEFT
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column( //TOP LEFT
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container( //PARTIE HAUTE TEMP ICON ACTUEL
                decoration: BoxDecoration(
                  // color: Color(0xFFF5F5F5).withOpacity(0.05),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 85,
                width: double.infinity,
                // Pour occuper toute la largeur de la colonne
                margin: EdgeInsets.all(3),
                child: Row(children: [ //ROW DE LA PARTIE HAUTE
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
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              (hourlyTemp.toList()[index][currentHour]).toString() + "°",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
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
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        //color: Color(0xFF07549D).withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 85,
                        //child: getAnimationAsset(weatherCode:weatherCode, hourValue:hourValue)

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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 85,
                        margin: EdgeInsets.all(3),
                      child:Padding(
                        padding:EdgeInsets.only(left: 10),
                        child:Text(
                          "Min. " + (tempMin.toList()[index]).toString() + "° \n"+ "Max. " + (tempMax.toList()[index]).toString() + "°",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //sunrise et sunset display
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                color: Color(0xFF07549D).withOpacity(0.05),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 50,
                              margin: EdgeInsets.all(3),
                              child: Row(
                                children: <Widget>[
                                  Lottie.asset("assets/icone/sunrise.json",height:40,width:40),
                                  //SizedBox(width:2 ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Levé",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Roboto',
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      Text(
                                        (DateFormat('HH:mm').format(
                                            DateTime.parse(dailySunriseHour[index]))),
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
                                color: Color(0xFF07549D).withOpacity(0.05),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 50,
                              margin: EdgeInsets.all(3),
                              child: Row(
                                children: <Widget>[
                                  Lottie.asset("assets/icone/sunset.json",height:40,width:40),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Couché",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Roboto',
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      Text(
                                        (DateFormat('HH:mm').format(
                                            DateTime.parse(dailySunsetHour[index]))),
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

}
