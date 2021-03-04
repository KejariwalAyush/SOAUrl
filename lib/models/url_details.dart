// To parse this JSON data, do
//
//     final urlDetails = urlDetailsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UrlList {
  UrlList({
    @required this.urlDetails,
  });

  final List<UrlDetails> urlDetails;

  factory UrlList.fromJson(String str) => UrlList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UrlList.fromMap(Map<String, dynamic> json) => UrlList(
        urlDetails: List<UrlDetails>.from(
            json["urlDetails"].map((x) => UrlDetails.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "urlDetails": List<dynamic>.from(urlDetails.map((x) => x.toMap())),
      };
}

class UrlDetails {
  UrlDetails({
    @required this.dateTime,
    @required this.email,
    @required this.longUrl,
    @required this.noOfDays,
    @required this.shortUrl,
    @required this.stats,
    @required this.uid,
    @required this.userId,
  });

  final DateTime dateTime;
  final String email;
  final String longUrl;
  final int noOfDays;
  final String shortUrl;
  final List<Stat> stats;
  final String uid;
  final String userId;

  factory UrlDetails.fromJson(String str) =>
      UrlDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UrlDetails.fromMap(Map<String, dynamic> json) => UrlDetails(
        dateTime: DateTime.parse(json["dateTime"]),
        email: json["email"],
        longUrl: json["longUrl"],
        noOfDays: json["noOfDays"],
        shortUrl: json["shortUrl"],
        stats:
            List<Stat>.from(json["stats"]?.map((x) => Stat.fromMap(x)) ?? []) ??
                [],
        uid: json["uid"],
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "dateTime": dateTime.toIso8601String(),
        "email": email,
        "longUrl": longUrl,
        "noOfDays": noOfDays,
        "shortUrl": shortUrl,
        "stats": List<dynamic>.from(stats?.map((x) => x.toMap()) ?? []) ?? [],
        "uid": uid,
        "userId": userId,
      };
}

class Stat {
  Stat({
    @required this.deviceType,
    @required this.ip,
    @required this.time,
  });

  final String deviceType;
  final String ip;
  final DateTime time;

  factory Stat.fromJson(String str) => Stat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        deviceType: json["device_type"],
        ip: json["ip"],
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toMap() => {
        "device_type": deviceType,
        "ip": ip,
        "time": time.toIso8601String(),
      };
}
