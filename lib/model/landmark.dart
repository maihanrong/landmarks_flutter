// To parse this JSON data, do
//
//     final landmark = landmarkFromJson(jsonString);

import 'dart:convert';

Landmark landmarkFromJson(String str) => Landmark.fromJson(json.decode(str));

String landmarkToJson(Landmark data) => json.encode(data.toJson());

class Landmark {
  Landmark({
    required this.name,
    required this.category,
    required this.city,
    required this.state,
    required this.id,
    required this.isFeatured,
    required this.isFavorite,
    required this.park,
    required this.coordinates,
    required this.description,
    required this.imageName,
  });

  String name;
  String category;
  String city;
  String state;
  int id;
  bool isFeatured;
  bool isFavorite;
  String park;
  Coordinates coordinates;
  String description;
  String imageName;

  factory Landmark.fromJson(Map<String, dynamic> json) => Landmark(
    name: json["name"],
    category: json["category"],
    city: json["city"],
    state: json["state"],
    id: json["id"],
    isFeatured: json["isFeatured"],
    isFavorite: json["isFavorite"],
    park: json["park"],
    coordinates: Coordinates.fromJson(json["coordinates"]),
    description: json["description"],
    imageName: json["imageName"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "category": category,
    "city": city,
    "state": state,
    "id": id,
    "isFeatured": isFeatured,
    "isFavorite": isFavorite,
    "park": park,
    "coordinates": coordinates.toJson(),
    "description": description,
    "imageName": imageName,
  };
}

class Coordinates {
  Coordinates({
    required this.longitude,
    required this.latitude,
  });

  double longitude;
  double latitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "latitude": latitude,
  };
}
