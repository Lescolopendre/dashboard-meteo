import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/models/data_pollution.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_icons/weather_icons.dart';
import 'dart:convert';
import '../models/villes.dart';
import '../widgets/city_search.dart';
import '../models/ville_france.dart';
import 'graph_temp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../screens/top_left.dart';
import '../screens/bottom_left.dart';
import '../screens/top_right.dart';
import '../screens/top_center.dart';
import 'graph_tabs.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String city = "Aujourd'hui";
  Ville? selectedVille;
  late Iterable<List<dynamic>> time;
  Iterable<List<dynamic>> temp = [];
  Iterable<List<dynamic>> tempApparent = [];
  Iterable<List<dynamic>> windSpeed = [];
  Iterable<List<dynamic>> humidity = [];
  Iterable<List<dynamic>> uvIndex = [];
  Iterable<List<dynamic>> hourlyAqi = [];
  late var precipitationHourlyProba;
  late Future<List<Ville>> villes;
  late List<Ville> allVilles = [];
  bool isRectangleFirst = true;
  List<dynamic> tempMax = [];
  List<dynamic> tempMin = [];
  late int currentHour;

  List<dynamic> dailySunriseHour = [];
  List<dynamic> dailySunsetHour = [];

  callback(Ville varCity, dataVille data,dataPollution datapollution) {
    setState(() {
      city = varCity.nomAvecArticle;
      selectedVille = varCity;
      time = data.hourlyTime;
      temp = data.hourlyTemp;
      tempApparent=data.hourlyApparentTemp;
      tempMax = data.dailyMaxTemp;
      tempMin = data.dailyMinTemp;
      windSpeed = data.hourlyWindSpeed;
      humidity = data.hourlyHumidity;
      uvIndex = data.hourlyUVIndex;
      precipitationHourlyProba=data.hourlyPrecipitationProba;
      currentHour=DateTime.now().hour;
      dailySunriseHour= data.dailySunriseHour;
      dailySunsetHour= data.dailySunsetHour;
      hourlyAqi= datapollution.hourlyAqi;
    });
  }


  @override
  void initState() {
    super.initState();
    city = 'Ivry-sur-Seine';
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
    final datapollution=await GetDataPollution(city.latitude,city.longitude).getData();
    return setState(() {
      selectedVille = city;
      time = data.hourlyTime;
      temp = data.hourlyTemp;
      tempApparent=data.hourlyApparentTemp;
      tempMax = data.dailyMaxTemp;
      tempMin = data.dailyMinTemp;
      hourlyAqi= datapollution.hourlyAqi;
      windSpeed = data.hourlyWindSpeed;
      humidity = data.hourlyHumidity;
      uvIndex = data.hourlyUVIndex;
      precipitationHourlyProba=data.hourlyPrecipitationProba;
      currentHour=DateTime.now().hour;
      dailySunriseHour= data.dailySunriseHour;
      dailySunsetHour= data.dailySunsetHour;
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
        title: Text("La Météo",
            style:TextStyle( fontSize: 25,
                    color:Colors.white,
                  ),
        ),
        actions: [
          SizedBox(
            width: 300.0,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  CitySearch(callback: callback, villes: allVilles),
                ],
              ),
            ),
          ),
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
                        SizedBox(height: 10),
                        Row(
                          children: [
                            // Carré à gauche
                            Container(
                              height: screenSize.height * 0.33,
                              width: screenSize.width * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFF5F5F5).withOpacity(0.1),
                              ),
                              margin: EdgeInsets.all(7),
                              child: getContentTopContainers(
                                tempMin: tempMin,
                                tempMax: tempMax,
                                hourlyTemp: temp,
                                currentHour: currentHour,
                                city: city,
                                dailySunriseHour: dailySunriseHour,
                                dailySunsetHour: dailySunsetHour,
                              ), //recup donnée top_left
                            ),
                            SizedBox(width: 7),
                            // Espacement entre le carré et le rectangle

                            // Rectangle au milieu
                            topCenterWidget(),
                            SizedBox(width: 7),
                            // Espacement entre le rectangle et le carré à droite

                            // Carré à droite
                            TopRightWidget(),
                            // Utilisation du widget défini dans top_right.dart
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            // Carré à gauche en bas
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
                              child:
                                  getContentBottomContainers(hourlyApparentTemp: tempApparent, currentHour:currentHour, hourlyWindSpeed:windSpeed, hourlyHumidity:humidity,hourlyUVIndex:uvIndex, hourlyAqi: hourlyAqi), //recup donnée bottom_left
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
                                  child: GraphTabs(
                                    temp: temp,
                                    pluie: precipitationHourlyProba,
                                  )),
                            ),
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
