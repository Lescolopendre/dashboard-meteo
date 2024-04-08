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
import 'package:intl/intl.dart';

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
  List<dynamic> dailySunriseHour = [];
  List<dynamic> dailySunsetHour = [];
  int selectedDayIndex = 0;

  final List<String> libellesJours = ["Aujourd'hui", "Demain"];

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
        leading: Image.asset("assets/icon_gooly_meteo.png",height:70,width:70),
        leadingWidth: 160,
        centerTitle: true,
        title: Container(
          child:SizedBox(
            width:700,
            child: Column(
              children: <Widget>[
                CitySearch(callback: callback, villes: allVilles),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                  Icons.help_outline,
                  color: Colors.white60,
                  size: 25
              ),
              onPressed: (){
              }
          ),
          SizedBox(width:30),
        ],
        backgroundColor: Colors.blue.shade900,

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
                // Bouton Jour Précédent
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      selectedDayIndex = selectedDayIndex > 0
                          ? selectedDayIndex - 1
                          : selectedDayIndex;
                    });
                  },
                ),
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
                        Text(
                          selectedDayIndex < 2
                              ? "${libellesJours[selectedDayIndex]} - $city"
                              : "${DateFormat('EEEE').format(DateTime.parse(time.toList()[selectedDayIndex][0]))} - $city",
                        ),
                        Row(
                          children: [
                            // Carré à gauche
                            Container(
                              height: screenSize.height * 0.33,
                              width: constraints.maxWidth * 0.22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                                color: Color(0xFFF5F5F5)
                                    .withOpacity(0.1),
                              ),
                              margin: EdgeInsets.all(5),
                              child: getContentTopContainers(
                                index: selectedDayIndex,
                                tempMin: tempMin,
                                tempMax: tempMax,
                                hourlyTemp: temp,
                                currentHour: currentHour,
                                city: city,
                                dailySunriseHour: dailySunriseHour,
                                dailySunsetHour: dailySunsetHour,
                                weather: weather,
                                hourlyWeatherCode: weather,
                              ), //recup donnée top_left
                            ),

                            // Rectangle au milieu
                            TopCenterWidget(
                              weather: weather.toList()[selectedDayIndex],
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
                                color: Color(0xFFF5F5F5)
                                    .withOpacity(0.1),
                              ),
                              margin: EdgeInsets.all(5),
                              child: getContentBottomContainers(
                                index: selectedDayIndex,
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
                                  index: selectedDayIndex,
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
                // Bouton Jour Suivant
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      selectedDayIndex = selectedDayIndex < 4
                          ? selectedDayIndex + 1
                          : selectedDayIndex;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
