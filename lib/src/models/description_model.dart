// To parse this JSON data, do
//
//     final description = descriptionFromJson(jsonString);

import 'dart:convert';

Description descriptionFromJson(String str) => Description.fromJson(json.decode(str));

String descriptionToJson(Description data) => json.encode(data.toJson());

class Description {
    Description({
        required this.name,
        required this.description,
    });

    String name;
    String description;

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
    };
}
