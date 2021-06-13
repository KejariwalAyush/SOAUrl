// To parse this JSON data, do
//
//     final qrDetails = qrDetailsFromMap(jsonString);

import 'dart:convert';

class QrDetails {
  QrDetails({
    this.id,
    required this.text,
    this.title,
    required this.time,
    this.tags,
    required this.scanned,
  });

  final String? id;
  final String? text;
  final String? title;
  final DateTime time;
  final List<String>? tags;
  final bool? scanned;

  factory QrDetails.fromJson(String str) => QrDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QrDetails.fromMap(Map<String, dynamic> json) => QrDetails(
        id: json['id'] ?? '',
        text: json["text"],
        title: json["title"] ?? '',
        time: DateTime.parse(json["time"]),
        tags: List<String>.from(json["tags"]?.map((x) => x) ?? []),
        scanned: json["scanned"],
      );

  Map<String, dynamic> toMap() => {
        "id": id ?? '',
        "text": text,
        "title": title ?? '',
        "time": time.toIso8601String(),
        "tags": List<String>.from(tags?.map((x) => x) ?? []),
        "scanned": scanned,
      };
}
