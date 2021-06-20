 
import 'dart:convert';

import 'liter_milk_models.dart';

Milkman milkmanFromJson(String str) => Milkman.fromJson(json.decode(str));

String milkmanToJson(Milkman data) => json.encode(data.toJson());

class Milkman {
    Milkman({
       
        required this.nombre,
        required this.apellido,
        required this.ci,
        required this.direccion,
         required this.photo,
         this.literMilks
    });
    
    String nombre;
    String apellido;
    String ci;
    String direccion;
    String photo;
    List<LiterMilk>? literMilks;
    factory Milkman.fromJson(Map<String, dynamic> json) => Milkman(
       
        nombre: json["nombre"],
        apellido: json["apellido"],
        ci: json["ci"],
        direccion: json["direccion"],
        photo: json["photo"],
        literMilks: List<LiterMilk>.from(
          json["literMilks"].map((x)=> LiterMilk.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
       
        "nombre": nombre,
        "apellido": apellido,
        "ci": ci,
        "direccion": direccion,
               "photo": photo,
               "literMilks": List<dynamic>.from(literMilks!.map((x)=> x.toJson()))
    };
}
