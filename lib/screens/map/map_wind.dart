import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FranceMapWithWind extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(46.603354, 1.888334), // Centrer la carte sur la France
          zoom: 4.5, // Zoom initial pour afficher la France
          minZoom: 4.5, // Zoom minimum où les tuiles de précipitations sont disponibles
          maxZoom: 9.0, // Zoom maximum où les tuiles de précipitations sont disponibles
        ),
        children: [
          TileLayer(
            urlTemplate:
            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'], // Sous-domaines pour améliorer la performance
          ),
          TileLayer(
            urlTemplate:
            'https://tile.openweathermap.org/map/wind_new/{z}/{x}/{y}.png?appid=c00feaeec48cc819f3c1464a14387b79',
            subdomains: ['a', 'b', 'c'], // Sous-domaines pour améliorer la performance
            minZoom: 3, // Zoom minimum où les tuiles de précipitations sont disponibles
            maxZoom: 10, // Zoom maximum où les tuiles de précipitations sont disponibles
          ),
        ],
      ),
    );
  }
}