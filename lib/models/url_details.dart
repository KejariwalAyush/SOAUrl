// To parse this JSON data, do
//
//     final urlDetails = urlDetailsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UrlDetails {
  UrlDetails({
    @required this.uid,
    @required this.shortUrl,
    @required this.longUrl,
    @required this.clicks,
    @required this.dayWise,
    @required this.isUrlActive,
    @required this.expireDate,
    @required this.creationDate,
  });

  final String uid;
  final String shortUrl;
  final String longUrl;
  final Clicks clicks;
  final List<DayWise> dayWise;
  final bool isUrlActive;
  final DateTime expireDate;
  final DateTime creationDate;

  factory UrlDetails.fromJson(String str) =>
      UrlDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UrlDetails.fromMap(Map<String, dynamic> json) => UrlDetails(
        uid: json["uid"],
        shortUrl: json["shortUrl"],
        longUrl: json["longUrl"],
        clicks: Clicks.fromMap(json["clicks"]),
        dayWise:
            List<DayWise>.from(json["dayWise"].map((x) => DayWise.fromMap(x))),
        isUrlActive: json["isUrlActive"],
        expireDate: DateTime.parse(json["expireDate"]),
        creationDate: DateTime.parse(json["creationDate"]),
      );

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "shortUrl": shortUrl,
        "longUrl": longUrl,
        "clicks": clicks.toMap(),
        "dayWise": List<dynamic>.from(dayWise.map((x) => x.toMap())),
        "isUrlActive": isUrlActive,
        "expireDate": expireDate.toIso8601String(),
        "creationDate": creationDate.toIso8601String(),
      };
}

class Clicks {
  Clicks({
    @required this.phone,
    @required this.desktop,
  });

  final int phone;
  final int desktop;

  factory Clicks.fromJson(String str) => Clicks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Clicks.fromMap(Map<String, dynamic> json) => Clicks(
        phone: json["phone"],
        desktop: json["desktop"],
      );

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "desktop": desktop,
      };
}

class DayWise {
  DayWise({
    @required this.date,
    @required this.clicks,
  });

  final DateTime date;
  final Clicks clicks;

  factory DayWise.fromJson(String str) => DayWise.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DayWise.fromMap(Map<String, dynamic> json) => DayWise(
        date: DateTime.parse(json["date"]),
        clicks: Clicks.fromMap(json["clicks"]),
      );

  Map<String, dynamic> toMap() => {
        "date": date.toIso8601String(),
        "clicks": clicks.toMap(),
      };
}
