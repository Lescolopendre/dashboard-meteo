import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:front/const/const.dart';
import 'package:front/screens/main_screen.dart';

void main() => runApp(MyApp());

class Ville {
  final String? nom;
  final double? longitude;
  final double? latitude;

  const Ville({this.nom, this.longitude, this.latitude});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La météo',
      theme: ThemeData(
        backgroundColor: backGroundColor,
        brightness: Brightness.light,
      ),
      home: HomePage(title: 'Fait-il bon ?'),
    );
  }
}


class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final TextEditingController _controller = TextEditingController();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city="Aujourd'hui";
  callback(varCity){
    setState(() {
      city=varCity;
    });
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
                  CitySearch(callback:callback),
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
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              child: Text("Aujourd'hui"),
              padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
              width: 1000,
              color: primaryBlueColor,
              margin: EdgeInsets.all(10),
            ),
            Container(
              child: Text("Demain"),
              padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
              width: 1000,
              color: secondaryBlueColor,
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
  CitySearch({required this.callback});
  static const List<Ville> villes = <Ville>[
    Ville(nom: 'Paris', longitude: 2.3522, latitude: 48.8566),
    Ville(nom: 'Marseille', longitude: 5.3698, latitude: 43.2965),
    Ville(nom: 'Lyon', longitude: 4.8357, latitude: 45.7640),
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return villes.where((Ville option) {
          return option.nom!
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        }).map((Ville ville) => ville.nom!);
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
