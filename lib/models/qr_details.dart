// To parse this JSON data, do
//
//     final qrDetails = qrDetailsFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

class QrDetails {
  QrDetails({
    @required this.text,
    this.title,
    @required this.time,
    this.tags,
    @required this.scanned,
  });

  final String text;
  String title;
  final DateTime time;
  List<String> tags;
  final bool scanned;

  factory QrDetails.fromJson(String str) => QrDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QrDetails.fromMap(Map<String, dynamic> json) => QrDetails(
        text: json["text"],
        title: json["title"] ?? '',
        time: DateTime.parse(json["time"]),
        tags: List<String>.from(json["tags"]?.map((x) => x) ?? []) ?? [],
        scanned: json["scanned"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "title": title ?? '',
        "time": time.toIso8601String(),
        "tags": List<String>.from(tags?.map((x) => x) ?? []) ?? [],
        "scanned": scanned,
      };
}
