// To parse this JSON data, do
//
//     final descriptionPayment = descriptionPaymentFromJson(jsonString);

import 'dart:convert';

DescriptionPayment descriptionPaymentFromJson(String str) => DescriptionPayment.fromJson(json.decode(str));

String descriptionPaymentToJson(DescriptionPayment data) => json.encode(data.toJson());

class DescriptionPayment {
    DescriptionPayment({
        required this.nombre,
        required this.description,
    });

    String nombre;
    String description;

    factory DescriptionPayment.fromJson(Map<String, dynamic> json) => DescriptionPayment(
        nombre: json["nombre"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "description": description,
    };
}
