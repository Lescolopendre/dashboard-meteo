import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/villes.dart';
import '../widgets/city_search.dart';
import '../models/ville_france.dart';
import 'package:fl_chart/fl_chart.dart';
import '../const/const.dart';
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

  callback(Ville varCity,dataVille data) {
    setState(()  {
      city = varCity.nomAvecArticle!;
      selectedVille = varCity;
      time=data.hourlyTime;
      temp=data.hourlyTemp;
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
      });
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        centerTitle: true,
        title: Text("La meteo"),
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
        backgroundColor: primaryBlueColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 100),
        height: 2000,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF637E92)
                ),
                padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
                width: 1000,
                margin: EdgeInsets.all(10),
                child: selectedVille != null
                  ? Wrap(
                  direction: Axis.horizontal,
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: [
                    Text(selectedVille!.nomAvecArticle!),
                    Text("Longitude: ${selectedVille!.longitude}"),
                    Text("Latitude: ${selectedVille!.latitude}"),
                    for (var heure in time.toList()[1]) Text(heure.toString()+""),
                    for (var temperature in temp.toList()[1]) Text(temperature.toString()+""),
                ],
              ):Wrap()
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF637E92)
              ),
              child: Text("Demain"),
              padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
              width: 1000,
              margin: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}
