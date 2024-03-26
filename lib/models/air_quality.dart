import 'package:flutter/material.dart';
import 'package:air_quality/air_quality.dart';
import '../screens/home_page.dart';

@override
class getAirQuality extends StatefulWidget {
  AirQuality _airQuality = AirQuality('https://waqi.info/#/c/47.527/3.538/5z');
  final String _cityName = 'Lyon';
  double _aqiValue = 0.0;
  String _aqiIndex = 'Unknown';

  String _getAQIIndex(double aqiValue) {
    if (aqiValue >= 0 && aqiValue <= 50) {
      return 'Good';
    } else if (aqiValue > 50 && aqiValue <= 100) {
      return 'Moderate';
    } else if (aqiValue > 100 && aqiValue <= 150) {
      return 'Unhealthy for Sensitive Groups';
    } else if (aqiValue > 150 && aqiValue <= 200) {
      return 'Unhealthy';
    } else if (aqiValue > 200 && aqiValue <= 300) {
      return 'Very Unhealthy';
    } else if (aqiValue > 300) {
      return 'Hazardous';
    } else {
      return 'Unknown';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qualité de l'air"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current AQI:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              _aqiValue.toString(),
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],

        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
