import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';
import '../models/villes.dart';
import '../widgets/city_search.dart';
import '../models/ville_france.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = "Aujourd'hui";
  Ville? selectedVille;
  late Iterable<List<dynamic>> time;
  late Iterable<List<dynamic>> temp;
  late Future<List<Ville>> villes;
  late List<Ville> allVilles = [];
  bool isRectangleFirst = true;

  callback(Ville varCity, dataVille data) {
    setState(() {
      city = varCity.nomAvecArticle!;
      selectedVille = varCity;
      time = data.hourlyTime;
      temp = data.hourlyTemp;
    });
  }

  @override
  void initState() {
    super.initState();
    city = 'Choisissez une ville.';
    villes = getVille(context);
    villes.then((value) {
      setState(() {
        allVilles = value;
        // Récupérer les données de la ville Ivry-sur-Seine une fois que la liste des villes est chargée
        Ville ivrySurSeine = allVilles
            .firstWhere((ville) => ville.nomAvecArticle == 'Ivry-sur-Seine');
        getDataForCity(ivrySurSeine);
      });
    });
  }

  void getDataForCity(Ville city) async {
    final data = await GetDataVille(city.latitude, city.longitude).getData();
    setState(() {
      selectedVille = city;
      time = data.hourlyTime;
      temp = data.hourlyTemp;
      // Affichez les données de la ville directement une fois récupérées
      city = selectedVille!;
    });
  }

  static Future<List<Ville>> getVille(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/villes.json');
    final body = json.decode(data);
    return body.map<Ville>((json) => Ville.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 72,
        centerTitle: true,
        title: Text("La Météo"),
        actions: [
          SizedBox(
            width: 400.0,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  CitySearch(callback: callback, villes: allVilles),
                ],
              ),
            ),
          )
        ],
        backgroundColor: Color(0xFF07549D),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(

            colors: [Colors.blue.shade800, Colors.blue.shade200],

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
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
                      spacing: 2.0,
                      runSpacing: 1.0,
                      children: [
                        Text("Aujourd'hui\t"),
                        Text(selectedVille!.nomAvecArticle!),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            // Carré à gauche
                            Container(
                              height: screenSize.height * 0.33,
                              width: screenSize.width * 0.2,
                              // Changer la largeur selon vos besoins
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFF5F5F5).withOpacity(0.1),
                              ),
                              margin: EdgeInsets.all(7),
                            ),
                            // Rectangle à droite (plus long)
                            Expanded(
                              child: Container(
                                height: screenSize.height * 0.33,
                                width: screenSize.width * 0.8,
                                // Changer la largeur selon vos besoins
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xFFF5F5F5).withOpacity(0.1),
                                ),
                                margin: EdgeInsets.all(7),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            // Carré à gauche
                            Container(
                              height: screenSize.height * 0.33,
                              width: screenSize.width * 0.2,
                              // Changer la largeur selon vos besoins
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFF5F5F5).withOpacity(0.1),
                              ),
                              margin: EdgeInsets.all(7),
                            ),
                            // Rectangle à droite (plus long)
                            Expanded(
                              child: Container(
                                height: screenSize.height * 0.33,
                                width: screenSize.width * 0.8,
                                // Changer la largeur selon vos besoins
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xFFF5F5F5).withOpacity(0.1),
                                ),
                                margin: EdgeInsets.all(7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )

                  : Text(city),
            ),
            Container(
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
                        Text(selectedVille!.nomAvecArticle!),
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
                                    height: 2* (screenSize.height * 0.33 - 14) / 5, // 1/3 de la hauteur disponible
                                    width: screenSize.width * 0.8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: Color(0xFFF5F5F5).withOpacity(0.1),
                                    ),
                                    margin: EdgeInsets.only(left: 7, right: 7, top: 7),
                                    child: Icon(
                                      Icons.wb_twighlight,
                                      color: Colors.deepOrangeAccent,
                                      size: 50.0,
                                    ),
                                  ),
                                  SizedBox(height: 7), // Espacement entre les deux rectangles
                                  // Deuxième rectangle (2/3 de la hauteur)
                                  Container(
                                    height: 3 * (screenSize.height * 0.33 - 14) / 5, // 2/3 de la hauteur disponible
                                    width: screenSize.width * 0.8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: Color(0xFFF5F5F5).withOpacity(0.1),
                                    ),
                                    margin: EdgeInsets.only(left: 7, right: 7, bottom: 7),

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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
            ),
          ],
        ),
      ),
    );
  }
}
