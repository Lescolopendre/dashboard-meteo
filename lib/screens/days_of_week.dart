import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';
import '../models/villes.dart';
import '../widgets/city_search.dart';
import '../models/ville_france.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'graph_day.dart';

class dayOfWeek extends StatelessWidget {
  final Ville? selectedVille;
  final String city;
  late final temp;

  dayOfWeek(
      {super.key, required this.selectedVille, required this.city, this.temp});

  Widget day(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFFF5F5F5).withOpacity(0.2), //couleur bulle 1
      ),
      padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
      width: screenSize.width - 100,
      margin: EdgeInsets.all(25),
      child: selectedVille != null
          ? Wrap(
              direction: Axis.horizontal,
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                Text("Demain\t"),
                Text(selectedVille!.nomAvecArticle),
                SizedBox(height: 10),
                Row(
                  children: [
                    // Carré à gauche
                    Container(
                      height: screenSize.height * 0.33,
                      width: screenSize.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFF5F5F5).withOpacity(0.1),
                      ),
                      margin: EdgeInsets.all(7),
                    ),
                    // Colonnes pour deux rectangles superposés à droite
                    Expanded(
                      child: Column(
                        children: [
                          // Premier rectangle (1/3 de la hauteur)
                          Container(
                            height: 2 * (screenSize.height * 0.33 - 14) / 5,
                            // 1/3 de la hauteur disponible
                            width: screenSize.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFF5F5F5).withOpacity(0.1),
                            ),
                            margin: EdgeInsets.only(left: 7, right: 7, top: 7),
                            child: Icon(
                              Icons.wb_twighlight,
                              color: Colors.deepOrangeAccent,
                              size: 50.0,
                            ),
                          ),
                          SizedBox(
                              height:
                                  7), // Espacement entre les deux rectangles
                          // Deuxième rectangle (2/3 de la hauteur)
                          Container(
                            height: 3 * (screenSize.height * 0.33 - 14) / 5,
                            // 2/3 de la hauteur disponible
                            width: screenSize.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFF5F5F5).withOpacity(0.1),
                            ),
                            margin:
                                EdgeInsets.only(left: 7, right: 7, bottom: 7),
                            child: GraphDay(points: temp.toList()[0]).graph(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    // Carré à gauche
                    Container(
                      height: screenSize.height * 0.35,
                      width: screenSize.width * 0.2,
                      // Changer la largeur selon vos besoins
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFF5F5F5).withOpacity(0.1),
                      ),
                      margin: EdgeInsets.all(7),
                    ),
                    // Rectangle à droite (plus long)
                  ],
                ),
              ],
            )
          : Text(city),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
