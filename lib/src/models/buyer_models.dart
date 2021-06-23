// To parse this JSON data, do
//
//     final buyer = buyerFromJson(jsonString);

import 'dart:convert';

Buyer buyerFromJson(String str) => Buyer.fromJson(json.decode(str));

String buyerToJson(Buyer data) => json.encode(data.toJson());

class Buyer {
    Buyer({
        required this.nombre,
        required this.apellido,
        required this.direccion,
        required this.valorxLitro,
        this.photo,
    });

    String nombre;
    String apellido;
    String direccion;
    String valorxLitro;
    String? photo;

    factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
        nombre: json["nombre"],
        apellido: json["apellido"],
        direccion: json["direccion"],
        valorxLitro: json["valorxLitro"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "direccion": direccion,
        "valorxLitro": valorxLitro,
        "photo": photo,
    };
}
