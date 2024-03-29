import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:quiver/iterables.dart';

class dataPollution {
  final Iterable<List<dynamic>> hourlyAqi;
  const dataPollution({
    required this.hourlyAqi


  });
  factory dataPollution.fromJson(Map<String, dynamic> json){
    return dataPollution(
      hourlyAqi: partition(json['hourly']['european_aqi_pm2_5'],24),
    );
  }
}

class GetDataPollution {
  final String latitude;
  final String longitude;

  GetDataPollution(this.latitude, this.longitude); //constructueur

  Future<dataPollution> getData() async{
    final response = await http.get(Uri.parse("https://air-quality-api.open-meteo.com/v1/air-quality?latitude="+latitude+"&longitude="+longitude+"&hourly=european_aqi_pm2_5&forecast_days=5"));
    if(response.statusCode==200){
      final data= jsonDecode(response.body);
      return dataPollution.fromJson(data);
    }else{
      throw Exception('HTTP Failed');
    }
  }
}







