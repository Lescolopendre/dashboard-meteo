import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'map/map_rain.dart';
import 'map/map_temp.dart';
import 'map/map_wind.dart';

class TopRightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFFF5F5F5).withOpacity(0.1),
      ),
      margin: EdgeInsets.all(7),
      child: DefaultTabController(
        length: 3, // Nombre d'onglets

        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      Lottie.asset("assets/icone/humidity.json"), // Adapter la taille de l'icône selon les besoins// Espacement entre l'icône et le texte de l'onglet
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Lottie.asset("assets/icone/thermometer.json"), // Adapter la taille de l'icône selon les besoins// Espacement entre l'icône et le texte de l'onglet
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Lottie.asset("assets/icone/wind.json"), // Adapter la taille de l'icône selon les besoins// Espacement entre l'icône et le texte de l'onglet
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  //affiche map pluie
                  FranceMapWithPrecipitation(),
                  //affiche map température
                  FranceMapWithTemp(),
                  //affiche map vent
                  FranceMapWithWind(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
