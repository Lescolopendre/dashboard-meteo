class Ville {
  String nomAvecArticle='';
  String longitude='';
  String latitude='';

  Ville({required this.nomAvecArticle, required this.longitude, required this.latitude});

  Ville.fromJson(Map<String, dynamic> json) {
    nomAvecArticle = json['Nom avec article'];
    longitude = json['Longitude'].toString();
    latitude = json['Latitude'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nom avec article'] = this.nomAvecArticle;
    data['Longitude'] = this.longitude;
    data['Latitude'] = this.latitude;
    return data;
  }
}
