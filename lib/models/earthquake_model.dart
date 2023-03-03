// To parse this JSON data, do
//
//     final earthquake = earthquakeFromMap(jsonString);

import 'dart:convert';

Earthquake earthquakeFromMap(String str) => Earthquake.fromMap(json.decode(str));

String earthquakeToMap(Earthquake data) => json.encode(data.toMap());

class Earthquake {
  Earthquake({
    this.earthquakeId,
    this.title,
    this.date,
    this.lokasyon,
    this.lat,
    this.lng,
    this.mag,
    this.depth,
    this.coordinates,
    this.geojson,
    this.locationProperties,
    this.rev,
    this.dateStamp,
    this.dateDay,
    this.dateHour,
    this.timestamp,
    this.locationTz,
  });

  String? earthquakeId;
  String? title;
  String? date;
  String? lokasyon;
  num? lat;
  num? lng;
  num? mag;
  num? depth;
  List<double>? coordinates;
  Geojson? geojson;
  LocationProperties? locationProperties;
  dynamic rev;
  DateTime? dateStamp;
  DateTime? dateDay;
  String? dateHour;
  String? timestamp;
  String? locationTz;

  factory Earthquake.fromMap(Map<String, dynamic> json) => Earthquake(
    earthquakeId: json["earthquake_id"],
    title: json["title"],
    date: json["date"],
    lokasyon: json["lokasyon"],
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    mag: json["mag"]?.toDouble(),
    depth: json["depth"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    geojson: json["geojson"] == null ? null : Geojson.fromMap(json["geojson"]),
    locationProperties: json["location_properties"] == null ? null : LocationProperties.fromMap(json["location_properties"]),
    rev: json["rev"],
    dateStamp: json["date_stamp"] == null ? null : DateTime.parse(json["date_stamp"]),
    dateDay: json["date_day"] == null ? null : DateTime.parse(json["date_day"]),
    dateHour: json["date_hour"],
    timestamp: json["timestamp"],
    locationTz: json["location_tz"],
  );

  Map<String, dynamic> toMap() => {
    "earthquake_id": earthquakeId,
    "title": title,
    "date": date,
    "lokasyon": lokasyon,
    "lat": lat,
    "lng": lng,
    "mag": mag,
    "depth": depth,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    "geojson": geojson?.toMap(),
    "location_properties": locationProperties?.toMap(),
    "rev": rev,
    "date_stamp": "${dateStamp!.year.toString().padLeft(4, '0')}-${dateStamp!.month.toString().padLeft(2, '0')}-${dateStamp!.day.toString().padLeft(2, '0')}",
    "date_day": "${dateDay!.year.toString().padLeft(4, '0')}-${dateDay!.month.toString().padLeft(2, '0')}-${dateDay!.day.toString().padLeft(2, '0')}",
    "date_hour": dateHour,
    "timestamp": timestamp,
    "location_tz": locationTz,
  };
}

class Geojson {
  Geojson({
    this.type,
    this.coordinates,
  });

  String? type;
  List<double>? coordinates;

  factory Geojson.fromMap(Map<String, dynamic> json) => Geojson(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

class LocationProperties {
  LocationProperties({
    this.closestCity,
    this.epiCenter,
    this.airports,
  });

  ClosestCity? closestCity;
  EpiCenter? epiCenter;
  List<Airport>? airports;

  factory LocationProperties.fromMap(Map<String, dynamic> json) => LocationProperties(
    closestCity: json["closestCity"] == null ? null : ClosestCity.fromMap(json["closestCity"]),
    epiCenter: json["epiCenter"] == null ? null : EpiCenter.fromMap(json["epiCenter"]),
    airports: json["airports"] == null ? [] : List<Airport>.from(json["airports"]!.map((x) => Airport.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "closestCity": closestCity?.toMap(),
    "epiCenter": epiCenter?.toMap(),
    "airports": airports == null ? [] : List<dynamic>.from(airports!.map((x) => x.toMap())),
  };
}

class Airport {
  Airport({
    this.distance,
    this.name,
    this.code,
    this.coordinates,
  });

  double? distance;
  String? name;
  String? code;
  Geojson? coordinates;

  factory Airport.fromMap(Map<String, dynamic> json) => Airport(
    distance: json["distance"]?.toDouble(),
    name: json["name"],
    code: json["code"],
    coordinates: json["coordinates"] == null ? null : Geojson.fromMap(json["coordinates"]),
  );

  Map<String, dynamic> toMap() => {
    "distance": distance,
    "name": name,
    "code": code,
    "coordinates": coordinates?.toMap(),
  };
}

class ClosestCity {
  ClosestCity({
    this.name,
    this.distance,
  });

  String? name;
  double? distance;

  factory ClosestCity.fromMap(Map<String, dynamic> json) => ClosestCity(
    name: json["name"],
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "distance": distance,
  };
}

class EpiCenter {
  EpiCenter({
    this.name,
  });

  String? name;

  factory EpiCenter.fromMap(Map<String, dynamic> json) => EpiCenter(
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
  };
}
