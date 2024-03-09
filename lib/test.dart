import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'La meteo',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        centerTitle: true,
        title: Text("La meteo"),
        actions: const [
          SizedBox(
            width: 250.0,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  AutocompleteBasicExample(),
                ],
              ),
            ),
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "big guys assembly",
          style: TextStyle(
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

class AutocompleteBasicExample extends StatelessWidget {
  const AutocompleteBasicExample({super.key});

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
            print('You just typed a new entry  $value');
          },
        );
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
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
