import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/villes.dart';
import '../widgets/city_search.dart';
import '../models/ville_france.dart';

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
        Ville ivrySurSeine = allVilles.firstWhere((ville) => ville.nomAvecArticle == 'Ivry-sur-Seine');
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
            width: 250.0,
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
        backgroundColor: Color(0xFF637E92),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade50],
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
                    color: Color(0xFF637E92).withOpacity(0.4), //couleur bulle 1
                ),
                padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
                width: screenSize.width-100,
                margin: EdgeInsets.all(50),
                child: selectedVille != null
                  ? Wrap(
                direction: Axis.horizontal,
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  Text("Aujourd'hui\t"),
                  Text(selectedVille!.nomAvecArticle!),
                  for (var heure in time.toList()[1])
                    Text(heure.toString() + ""),
                  for (var temperature in temp.toList()[1])
                    Text(temperature.toString() + ""),
                ],
              ):Text(city),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF637E92).withOpacity(0.4)
              ),
              padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
              width: screenSize.width-100,
              margin: EdgeInsets.all(50),
              child: selectedVille != null
                  ? Wrap(
                direction: Axis.horizontal,
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  Text("Demain\t"),
                  Text(selectedVille!.nomAvecArticle!),
                  for (var heure in time.toList()[2])
                    Text(heure.toString() + ""),
                  for (var temperature in temp.toList()[2])
                    Text(temperature.toString() + ""),
                ],
              ):Text(city),
            ),
          ],
        ),
      ),
    );
  }
}
