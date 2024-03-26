import 'package:flutter/material.dart';
import 'map/map_cloud.dart';
import 'map/map_rain.dart';
import 'map/map_temp.dart';
import 'map/map_wind.dart';

class TopRightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width * 0.2, // Augmentation de la largeur à 0.3
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFFF5F5F5).withOpacity(0.1),
      ),
      margin: EdgeInsets.all(7),
      child: DefaultTabController(
        length: 4, // Nombre d'onglets
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(icon: Icon(Icons.water_drop)), // Onglet pour la carte
                Tab(icon: Icon(Icons.thermostat)), // Onglet pour les détails
                Tab(icon: Icon(Icons.cloud)), // Onglet pour la carte
                Tab(icon: Icon(Icons.air)), // Onglet pour la carte
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  //affiche map pluie
                  FranceMapWithPrecipitation(),
                  //affiche map température
                  FranceMapWithTemp(),
                  // afiche map nuages
                  FranceMapWithCloud(),
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
