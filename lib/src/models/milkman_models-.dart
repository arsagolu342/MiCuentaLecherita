import 'dart:convert';
import 'package:tu_cuenta_lecherita/src/models/liter_milk_models.dart';
import 'package:tu_cuenta_lecherita/src/models/payment_models.dart';
Milkman milkmanFromJson(String str) => Milkman.fromJson(json.decode(str));
String milkmanToJson(Milkman data) => json.encode(data.toJson());
class Milkman {
  Milkman(
      {required this.nombre,
      required this.apellido,
      required this.ci,
      required this.direccion,
      this.photo,
      this.literMilk,
      this.payment});
  String nombre;
  String apellido;
  String ci;
  String direccion;
  String? photo;
  List<LiterMilk>? literMilk;
  List<Payment>? payment;
  factory Milkman.fromJson(Map<String, dynamic> json) => Milkman(
        nombre: json["nombre"],
        apellido: json["apellido"],
        ci: json["ci"],
        direccion: json["direccion"],
        photo: json["photo"],
        /*literMilk: List<Allergy>.from(
            json["literMilk"]?.map((x) => LiterMilk.fromJson(x))),
        */
        /*payment: List<Payment>.from(
            json["payment"]?.map((x) => Payment.fromJson(x))),
        */
      );
  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "ci": ci,
        "direccion": direccion,
        "photo": photo,
        "literMilk": List<dynamic>.from(literMilk!.map((x) => x.toJson())),
        "payment": List<dynamic>.from(payment!.map((x) => x.toJson())),
      };
}
