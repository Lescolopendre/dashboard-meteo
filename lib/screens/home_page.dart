import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import '../models/villes.dart';
import '../widgets/city_search.dart';
import '../models/ville_france.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../screens/top_left.dart';
import '../screens/bottom_left.dart';
import '../screens/top_right.dart';
import '../screens/top_center.dart';
import 'graph_tabs.dart';
import 'package:flutter/painting.dart';
import 'package:front/models/data_pollution.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_icons/weather_icons.dart';

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
  late var weather;
  late Future<List<Ville>> villes;
  late List<Ville> allVilles = [];
  bool isRectangleFirst = true;
  List<dynamic> tempMax = [];
  List<dynamic> tempMin = [];
  late int currentHour;
  Iterable<List<dynamic>> hourlyWeatherCode=[];
  List<dynamic> dailySunriseHour = [];
  List<dynamic> dailySunsetHour = [];

  callback(Ville varCity, dataVille data, dataPollution datapollution) {
    setState(() {
      city = varCity.nomAvecArticle;
      selectedVille = varCity;
      time = data.hourlyTime;
      temp = data.hourlyTemp;
      tempApparent = data.hourlyApparentTemp;
      tempMax = data.dailyMaxTemp;
      tempMin = data.dailyMinTemp;
      hourlyAqi = datapollution.hourlyAqi;
      weather = data.hourlyWeatherCode;
      windSpeed = data.hourlyWindSpeed;
      humidity = data.hourlyHumidity;
      uvIndex = data.hourlyUVIndex;
      precipitationHourlyProba = data.hourlyPrecipitationProba;
      currentHour = DateTime.now().hour;
      dailySunriseHour = data.dailySunriseHour;
      dailySunsetHour = data.dailySunsetHour;
      hourlyAqi = datapollution.hourlyAqi;
      hourlyWeatherCode= data.hourlyWeatherCode;
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
    final datapollution =
    await GetDataPollution(city.latitude, city.longitude).getData();
    return setState(() {
      selectedVille = city;
      time = data.hourlyTime;
      temp = data.hourlyTemp;
      tempApparent = data.hourlyApparentTemp;
      tempMax = data.dailyMaxTemp;
      tempMin = data.dailyMinTemp;
      hourlyAqi = datapollution.hourlyAqi;
      weather = data.hourlyWeatherCode;
      windSpeed = data.hourlyWindSpeed;
      humidity = data.hourlyHumidity;
      uvIndex = data.hourlyUVIndex;
      precipitationHourlyProba = data.hourlyPrecipitationProba;
      currentHour = DateTime.now().hour;
      dailySunriseHour = data.dailySunriseHour;
      dailySunsetHour = data.dailySunsetHour;
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
        title: Text(
          "La Météo",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
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
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color:
                      Color(0xFFF5F5F5).withOpacity(0.2), //couleur bulle 1
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
                    width: screenSize.width - 100,
                    margin: EdgeInsets.all(25),
                    child: selectedVille != null
                        ? LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Column(
                        children: [
                          Text("Aujourd'hui\t" + " - \t" + city),
                          Row(
                            children: [
                              // Carré à gauche
                              Container(
                                height: screenSize.height * 0.33,
                                width: constraints.maxWidth * 0.22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  color:
                                  Color(0xFFF5F5F5).withOpacity(0.1),
                                ),
                                margin: EdgeInsets.all(5),
                                child: getContentTopContainers(
                                  index: 0,
                                  tempMin: tempMin,
                                  tempMax: tempMax,
                                  hourlyTemp: temp,
                                  currentHour: currentHour,
                                  city: city,
                                  dailySunriseHour: dailySunriseHour,
                                  dailySunsetHour: dailySunsetHour,

                                  weather: weather,
                                  hourlyWeatherCode:hourlyWeatherCode

                                ), //recup donnée top_left
                              ),

                              // Rectangle au milieu
                              TopCenterWidget(
                                weather: weather.toList()[0],
                                boxConstraints: constraints,
                              ),
                              // Carré à droite
                              TopRightWidget(
                                boxConstraints: constraints,
                              ),
                              // Utilisation du widget défini dans top_right.dart
                            ],
                          ),
                          //SizedBox(height: 10),
                          Row(
                            children: [
                              // Carré à gauche en bas
                              Container(
                                height: constraints.maxHeight * 0.42,
                                width: constraints.maxWidth * 0.22,
                                // Changer la largeur selon vos besoins
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  color:
                                  Color(0xFFF5F5F5).withOpacity(0.1),
                                ),
                                margin: EdgeInsets.all(5),
                                child: getContentBottomContainers(
                                  index: 0,
                                  hourlyApparentTemp: tempApparent,
                                  currentHour: currentHour,
                                  hourlyWindSpeed: windSpeed,
                                  hourlyHumidity: humidity,
                                  hourlyUVIndex: uvIndex,
                                  hourlyAqi: hourlyAqi,
                                ), //recup donnée bottom_left
                              ),
                              // Rectangle à droite (plus long)
                              Container(
                                  height: constraints.maxHeight * 0.42,
                                  width: constraints.maxWidth * 0.75,
                                  // Changer la largeur selon vos besoins
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Color(0xFFF5F5F5)
                                        .withOpacity(0.1),
                                  ),
                                  margin: EdgeInsets.all(7),
                                  child: GraphTabs(
                                    index: 0,
                                    temp: temp,
                                    pluie: precipitationHourlyProba,
                                  )),
                            ],
                          ),
                        ],
                      );
                    })
                        : Text(city)),
                // Ajout d'un espacement entre les deux conteneurs
                // Répétez la structure pour le deuxième grand conteneur
                for(var i=1;i<5;i++)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color:
                      Color(0xFFF5F5F5).withOpacity(0.2), //couleur bulle 1
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
                    width: screenSize.width - 100,
                    margin: EdgeInsets.all(25),
                    child: selectedVille != null
                        ? LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Column(
                        children: [
                          Text("Demain\t" + " - \t" + city),
                          Row(
                            children: [
                              // Carré à gauche
                              Container(
                                height: screenSize.height * 0.33,
                                width: constraints.maxWidth * 0.22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  color:
                                  Color(0xFFF5F5F5).withOpacity(0.1),
                                ),
                                margin: EdgeInsets.all(5),
                                child: getContentTopContainers(
                                  index: i,
                                  tempMin: tempMin,
                                  tempMax: tempMax,
                                  hourlyTemp: temp,
                                  currentHour: currentHour,
                                  city: city,
                                  dailySunriseHour: dailySunriseHour,
                                  dailySunsetHour: dailySunsetHour,
                                  weather:weather,
                                  hourlyWeatherCode:hourlyWeatherCode,

                                ), //recup donnée top_left
                              ),

                              // Rectangle au milieu
                              TopCenterWidget(
                                weather: weather.toList()[i],
                                boxConstraints: constraints,
                              ),
                              // Carré à droite
                              TopRightWidget(
                                boxConstraints: constraints,
                              ),
                              // Utilisation du widget défini dans top_right.dart
                            ],
                          ),
                          //SizedBox(height: 10),
                          Row(
                            children: [
                              // Carré à gauche en bas
                              Container(
                                height: constraints.maxHeight * 0.42,
                                width: constraints.maxWidth * 0.22,
                                // Changer la largeur selon vos besoins
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  color:
                                  Color(0xFFF5F5F5).withOpacity(0.1),
                                ),
                                margin: EdgeInsets.all(5),
                                child: getContentBottomContainers(
                                  index: i,
                                  hourlyApparentTemp: tempApparent,
                                  currentHour: currentHour,
                                  hourlyWindSpeed: windSpeed,
                                  hourlyHumidity: humidity,
                                  hourlyUVIndex: uvIndex,
                                  hourlyAqi: hourlyAqi,
                                ), //recup donnée bottom_left
                              ),
                              // Rectangle à droite (plus long)
                              Container(
                                  height: constraints.maxHeight * 0.42,
                                  width: constraints.maxWidth * 0.75,
                                  // Changer la largeur selon vos besoins
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Color(0xFFF5F5F5)
                                        .withOpacity(0.1),
                                  ),
                                  margin: EdgeInsets.all(7),
                                  child: GraphTabs(
                                    index: i,
                                    temp: temp,
                                    pluie: precipitationHourlyProba,
                                  )),
                            ],
                          ),
                        ],
                      );
                    })
                        : Text(city),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
