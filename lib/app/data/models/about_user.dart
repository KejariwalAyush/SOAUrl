// To parse this JSON data, do
//
//     final aboutUser = aboutUserFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AboutUser {
  AboutUser({
    @required this.name,
    @required this.phone,
    @required this.email,
    @required this.id,
  });

  final String name;
  final String phone;
  final String email;
  final String id;

  factory AboutUser.fromJson(String str) => AboutUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AboutUser.fromMap(Map<String, dynamic> json) => AboutUser(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "phone": phone,
        "email": email,
        "id": id,
      };
}
