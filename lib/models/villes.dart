class Ville {
  String? nomAvecArticle;
  double? longitude;
  double? latitude;

  Ville({this.nomAvecArticle, this.longitude, this.latitude});

  Ville.fromJson(Map<String, dynamic> json) {
    nomAvecArticle = json['Nom avec article'];
    longitude = json['Longitude'];
    latitude = json['Latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nom avec article'] = this.nomAvecArticle;
    data['Longitude'] = this.longitude;
    data['Latitude'] = this.latitude;
    return data;
  }
}
