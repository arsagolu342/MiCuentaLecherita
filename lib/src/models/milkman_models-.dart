import 'dart:convert';

Milkman milkmanFromJson(String str) => Milkman.fromJson(json.decode(str));
String milkmanToJson(Milkman data) => json.encode(data.toJson());
class Milkman {
  Milkman(
      {
      required this.idmilkman,  
      required this.nombre,
      required this.apellido,
      required this.ci,
      required this.direccion,
      this.photo,
      // this.literMilk,
      // this.payment
      });
      
  String idmilkman;   
  String nombre;
  String apellido;
  String ci;
  String direccion;
  String? photo;
  // List<LiterMilk>? literMilk;
  // List<Payment>? payment;
  factory Milkman.fromJson(Map<String, dynamic> json) => Milkman(
        idmilkman: json["idmilkman"],
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
        "idmilkman": idmilkman,
        "nombre": nombre,
        "apellido": apellido,
        "ci": ci,
        "direccion": direccion,
        "photo": photo,
      //   "literMilk": List<dynamic>.from(literMilk!.map((x) => x.toJson())),
      //   "payment": List<dynamic>.from(payment!.map((x) => x.toJson())),
      // 
      };
}
