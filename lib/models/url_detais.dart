// To parse this JSON data, do
//
//     final urlDetails = urlDetailsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UrlDetails {
  UrlDetails({
    @required this.userId,
    @required this.email,
    @required this.longUrl,
    @required this.shortUrl,
    @required this.noOfDays,
    @required this.uid,
    @required this.dateTime,
    @required this.urlDetailsSwitch,
  });

  final String userId;
  final String email;
  final String longUrl;
  final String shortUrl;
  final int noOfDays;
  final String uid;
  final DateTime dateTime;
  final bool urlDetailsSwitch;

  factory UrlDetails.fromJson(String str) =>
      UrlDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UrlDetails.fromMap(Map<String, dynamic> json) => UrlDetails(
        userId: json["userId"],
        email: json["email"],
        longUrl: json["longUrl"],
        shortUrl: json["shortUrl"],
        noOfDays: json["noOfDays"],
        uid: json["uid"],
        dateTime: DateTime.parse(json["dateTime"]),
        urlDetailsSwitch: json["switch"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "email": email,
        "longUrl": longUrl,
        "shortUrl": shortUrl,
        "noOfDays": noOfDays,
        "uid": uid,
        "dateTime": dateTime.toIso8601String(),
        "switch": urlDetailsSwitch,
      };
}
