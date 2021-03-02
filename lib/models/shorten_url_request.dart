// To parse this JSON data, do
//
//     final urlDetails = urlDetailsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ShortenUrlRequestModel {
  ShortenUrlRequestModel({
    @required this.userId,
    @required this.email,
    @required this.longUrl,
    @required this.shortUrl,
    @required this.noOfDays,
    @required this.dateTime,
    // @required this.uid,
    // @required this.isUrlActive,
  });

  final String userId;
  final String email;
  final String longUrl;
  final String shortUrl;
  final int noOfDays;
  final DateTime dateTime;
  // final String uid;
  // final bool isUrlActive;

  factory ShortenUrlRequestModel.fromJson(String str) =>
      ShortenUrlRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShortenUrlRequestModel.fromMap(Map<String, dynamic> json) =>
      ShortenUrlRequestModel(
        userId: json["userId"],
        email: json["email"],
        longUrl: json["longUrl"],
        shortUrl: json["shortUrl"],
        noOfDays: json["noOfDays"],
        dateTime: DateTime.parse(json["dateTime"]),
        // uid: json["uid"],
        // isUrlActive: json["isUrlActive"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "email": email,
        "longUrl": longUrl,
        "shortUrl": shortUrl,
        "noOfDays": noOfDays,
        "dateTime": dateTime.toIso8601String(),
        // "uid": uid,
        // "isUrlActive": isUrlActive,
      };
}
