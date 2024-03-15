import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class Ville {
  String? nomAvecArticle;
  double? longitude;
  double? latitude;

  Ville({this.nomAvecArticle, this.longitude, this.latitude});

  Ville.fromJson(Map<String, dynamic> json) {
    nomAvecArticle = json['Nom avec article'];
    longitude = json['Longitude'];
    latitude = json['Latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nom avec article'] = this.nomAvecArticle;
    data['Longitude'] = this.longitude;
    data['Latitude'] = this.latitude;
    return data;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La météo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      home: HomePage(title: 'Fait-il bon ?'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String city = "Aujourd'hui";
  late Future<List<Ville>> villes;
  late List<Ville> allVilles = [];

  callback(varCity){
    setState(() {
      city = varCity;
    });
  }

  @override
  void initState() {
    super.initState();
    city = 'Big Guys';
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
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 100),
        height: 2000,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              child: Text("Aujourd'hui"),
              padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
              width: 1000,
              color: Colors.blue,
              margin: EdgeInsets.all(10),
            ),
            Container(
              child: Text("Demain"),
              padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
              width: 1000,
              color: Colors.green,
              margin: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}

class CitySearch extends StatelessWidget {
  final Function callback;
  final List<Ville> villes;

  CitySearch({required this.callback, required this.villes});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return villes.where((Ville option) {
          return option.nomAvecArticle!
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        }).map((Ville ville) => ville.nomAvecArticle!);
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.blue[100],
            prefixIcon: Icon(Icons.search),
            hintText: 'Rechercher une ville',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.blue.shade100),
            ),
          ),
          focusNode: focusNode,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
          },
        );
      },
      onSelected: (String selection) {
        callback(selection);
      },
    );
  }
}
