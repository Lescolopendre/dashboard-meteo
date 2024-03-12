import 'dart:convert';
import 'package:http/http.dart' as http;

class dataVille {
  final List<String> hourlyTime;
  final List<double> hourlyTemp;
  final List<int> hourlyHumidity;
  final List<double> hourlyApparentTemp;
  final List<int> hourlyPrecipitationProba;
  final List<double> hourlyPrecipitation;
  final List<int> hourlyCLoudCover;
  final List<int> hourlyLowCLoud;
  final List<int> hourlyMidCLoud;
  final List<int> hourlyHighCLoud;
  final List<double> hourlyWindSpeed;
  final List<int> hourlyWindDirecion;
  final List<double> hourlyUVIndex;
  final List<bool> isDay;
  final List<String> dailyDate;
  final List<double> dailyMaxTemp;
  final List<double> dailyMinTemp;
  final List<double> dailyApparentMaxTemp;
  final List<double> dailyApparentMinTemp;
  final List<String> dailySunriseHour;
  final List<String> dailySunsetHour;
  final List<double> dailyDaylightDuration;
  final List<double> dailySunshineDuration;
  final List<double> dailyMaxUVIndex;
  final List<double> dailySumPrecipitation;
  final List<double> dailyPrecipitationHours;
  final List<int> dailyWindDirectionDominant;

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
    required this.dailyPrecipitationHours,
    required this.dailyWindDirectionDominant,

  });

  factory dataVille.fromJson(Map<String, dynamic> json){
    return dataVille(
        hourlyTime: json['hourly']['time'],
        hourlyTemp: json['hourly']['temperature_2m'],
        hourlyHumidity: json['hourly']['relative_humidity_2m'],
        hourlyApparentTemp: json['hourly']['apparent_temperature'],
        hourlyPrecipitationProba: json['hourly']['precipitation_probability'],
        hourlyPrecipitation: json['hourly']['precipitation'],
        hourlyCLoudCover: json['hourly']['cloud_cover'],
        hourlyLowCLoud: json['hourly']['cloud_cover_low'],
        hourlyMidCLoud: json['hourly']['cloud_cover_mid'],
        hourlyHighCLoud: json['hourly']['cloud_cover_high'],
        hourlyWindSpeed: json['hourly']['wind_speed_10m'],
        hourlyWindDirecion: json['hourly']['wind_direction_10m'],
        hourlyUVIndex: json['hourly']['uv_index'],
        isDay: json['hourly']['is_day'],
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
        dailyPrecipitationHours: json['daily']['precipitation_hours'],
        dailyWindDirectionDominant: json['daily']['wind_direction_10m_dominant'],
    );
  }
}
class GetDataVille {
  Future<dataVille> getData() async{
    final response = await http.get(Uri.parse("https://api.open-meteo.com/v1/forecast?latitude=44.054667772&longitude=5.130335646&hourly=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation_probability,precipitation,cloud_cover,cloud_cover_low,cloud_cover_mid,cloud_cover_high,wind_speed_10m,wind_direction_10m,uv_index,is_day&daily=temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,daylight_duration,sunshine_duration,uv_index_max,precipitation_sum,precipitation_hours,wind_direction_10m_dominant&timezone=auto"));
  if(response.statusCode==200){
    final data= jsonDecode(response.body);
    return dataVille.fromJson(data);
  }else{
    throw Exception('HTTP Failed');
  }
  }
}
