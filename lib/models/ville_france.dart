import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiver/iterables.dart';

class dataVille {
  final Iterable<List<dynamic>> hourlyTime;
  final Iterable<List<dynamic>> hourlyTemp;
  final Iterable<List<dynamic>> hourlyHumidity;
  final Iterable<List<dynamic>> hourlyApparentTemp;
  final Iterable<List<dynamic>> hourlyPrecipitationProba;
  final Iterable<List<dynamic>> hourlyPrecipitation;
  final Iterable<List<dynamic>> hourlyCLoudCover;
  final Iterable<List<dynamic>> hourlyLowCLoud;
  final Iterable<List<dynamic>> hourlyMidCLoud;
  final Iterable<List<dynamic>> hourlyHighCLoud;
  final Iterable<List<dynamic>> hourlyWindSpeed;
  final Iterable<List<dynamic>> hourlyWindDirecion;
  final Iterable<List<dynamic>> hourlyUVIndex;
  final Iterable<List<dynamic>> isDay;
  final List<dynamic> dailyDate;
  final List<dynamic> dailyMaxTemp;
  final List<dynamic> dailyMinTemp;
  final List<dynamic> dailyApparentMaxTemp;
  final List<dynamic> dailyApparentMinTemp;
  final List<dynamic> dailySunriseHour;
  final List<dynamic> dailySunsetHour;
  final List<dynamic> dailyDaylightDuration;
  final List<dynamic> dailySunshineDuration;
  final List<dynamic> dailyMaxUVIndex;
  final List<dynamic> dailySumPrecipitation;
  final List<dynamic> dailyWindDirectionDominant;


  const dataVille({
    required this.hourlyTime,
    required this.hourlyTemp,
    required this.hourlyHumidity,
    required this.hourlyApparentTemp,
    required this.hourlyPrecipitationProba,
    required this.hourlyPrecipitation,
    required this.hourlyCLoudCover,
    required this.hourlyLowCLoud,
    required this.hourlyMidCLoud,
    required this.hourlyHighCLoud,
    required this.hourlyWindSpeed,
    required this.hourlyWindDirecion,
    required this.hourlyUVIndex,
    required this.isDay,
    required this.dailyDate,
    required this.dailyMaxTemp,
    required this.dailyMinTemp,
    required this.dailyApparentMaxTemp,
    required this.dailyApparentMinTemp,
    required this.dailySunriseHour,
    required this.dailySunsetHour,
    required this.dailyDaylightDuration,
    required this.dailySunshineDuration,
    required this.dailyMaxUVIndex,
    required this.dailySumPrecipitation,
    required this.dailyWindDirectionDominant,


  });

  factory dataVille.fromJson(Map<String, dynamic> json){
    return dataVille(

        hourlyTime: partition(json['hourly']['time'],24),
        hourlyTemp: partition(json['hourly']['temperature_2m'],24),
        hourlyHumidity: partition(json['hourly']['relative_humidity_2m'],24),
        hourlyApparentTemp: partition(json['hourly']['apparent_temperature'],24),
        hourlyPrecipitationProba: partition(json['hourly']['precipitation_probability'],24),
        hourlyPrecipitation: partition(json['hourly']['precipitation'],24),
        hourlyCLoudCover: partition(json['hourly']['cloud_cover'],24),
        hourlyLowCLoud: partition(json['hourly']['cloud_cover_low'],24),
        hourlyMidCLoud: partition(json['hourly']['cloud_cover_mid'],24),
        hourlyHighCLoud: partition(json['hourly']['cloud_cover_high'],24),
        hourlyWindSpeed: partition(json['hourly']['wind_speed_10m'],24),
        hourlyWindDirecion: partition(json['hourly']['wind_direction_10m'],24),
        hourlyUVIndex: partition(json['hourly']['uv_index'],24),
        isDay: partition(json['hourly']['is_day'],24),
        dailyDate: json['daily']['time'],
        dailyMaxTemp: json['daily']['temperature_2m_max'],
        dailyMinTemp: json['daily']['temperature_2m_min'],
        dailyApparentMaxTemp: json['daily']['apparent_temperature_max'],
        dailyApparentMinTemp: json['daily']['apparent_temperature_min'],
        dailySunriseHour: json['daily']['sunrise'],
        dailySunsetHour: json['daily']['sunset'],
        dailyDaylightDuration: json['daily']['daylight_duration'],
        dailySunshineDuration: json['daily']['sunshine_duration'],
        dailyMaxUVIndex: json['daily']['uv_index_max'],
        dailySumPrecipitation: json['daily']['precipitation_sum'],
        dailyWindDirectionDominant: json['daily']['wind_direction_10m_dominant']
    );
  }
}
class GetDataVille {
  final String latitude;
  final String longitude;

  GetDataVille(this.latitude, this.longitude);

  Future<dataVille> getData() async{
    final response = await http.get(Uri.parse("https://api.open-meteo.com/v1/forecast?latitude="+latitude+"&longitude="+longitude+"&hourly=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation_probability,precipitation,weather_code,cloud_cover,cloud_cover_low,cloud_cover_mid,cloud_cover_high,wind_speed_10m,wind_direction_10m,uv_index,is_day&daily=temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,daylight_duration,sunshine_duration,uv_index_max,precipitation_sum,wind_direction_10m_dominant&timezone=auto"));
  if(response.statusCode==200){
    final data= jsonDecode(response.body);
    return dataVille.fromJson(data);
  }else{
    throw Exception('HTTP Failed');
  }
  }
}
