import 'package:flutter/material.dart';
import 'package:front/models/data_pollution.dart';
import '../models/villes.dart';
import '../models/ville_france.dart';

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
          style: TextStyle(color: Colors.white),
          controller: textEditingController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,color: Colors.white70),
            hintText: 'Rechercher une ville',
            hintStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white60),
            ),
          ),
          focusNode: focusNode,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
          },
        );
      },
      onSelected: (String selection) async {
        Ville selectedVille=villes.firstWhere((ville) => ville.nomAvecArticle == selection);
        final data = await GetDataVille(selectedVille!.latitude,selectedVille!.longitude).getData();
        final datapollution=await GetDataPollution(selectedVille!.latitude,selectedVille!.longitude).getData();
        callback(selectedVille,data,datapollution);

      },
    );
  }
}
