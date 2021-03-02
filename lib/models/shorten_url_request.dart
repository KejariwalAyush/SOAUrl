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
    @required this.uid,
    @required this.dateTime,
    // @required this.isUrlActive,
  });

  final String userId;
  final String email;
  final String longUrl;
  final String shortUrl;
  final int noOfDays;
  final String uid;
  final DateTime dateTime;
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
        uid: json["uid"],
        dateTime: DateTime.parse(json["dateTime"]),
        // isUrlActive: json["isUrlActive"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "email": email,
        "longUrl": longUrl,
        "shortUrl": shortUrl,
        "noOfDays": noOfDays,
        "uid": uid,
        "dateTime": dateTime.toIso8601String(),
        // "isUrlActive": isUrlActive,
      };
}
