import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          title: Text("La meteo"),
          centerTitle: true,
          backgroundColor: Colors.red[500],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              TextField(
                decoration:  InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Rechercher une ville',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Text("big guys assembly",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.green,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: Text("Guns"),
          backgroundColor: Colors.red[500],
        ),
      ),
    );

  }
}
class Ville {
  final String nom;
  const Ville({
    required this.nom,
  });
}
const allVille=[
  Ville(
    nom:'Mazan',
  ),
  Ville(
    nom:'Carpentras',
  ),
  Ville(
    nom:'Lyon',
  ),
  Ville(
    nom:'Paris',
  ),
  Ville(
    nom:'Bordeaux',
  ),
  Ville(
    nom:'Lille',
  ),
];