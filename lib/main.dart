import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La météo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'La météo'),
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
  String city='Big Guys';
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
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          city,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Guns"),
        backgroundColor: Colors.lightBlue[50],
      ),
    );
  }
}

class CitySearch extends StatelessWidget {
  final Function callback;
  CitySearch({required this.callback});
  static const List<String> villes = <String>[
    'Mazan',
    'Paris',
    'Lyon',
    'Bordeaux',
    'Lille',
    'AAAAA'
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return villes.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
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

/*class Ville {
  final String nom;

  const Ville({
    required this.nom,
  });
}

const allVille = [
  Ville(
    nom: 'Mazan',
  ),
  Ville(
    nom: 'Paris',
  ),
  Ville(
    nom: 'Lyon',
  ),
  Ville(
    nom: 'Bordeaux',
  ),
  Ville(
    nom: 'Lille',
  ),
];*/
