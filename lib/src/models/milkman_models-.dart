import 'dart:convert';

Milkman milkmanFromJson(String str) => Milkman.fromJson(json.decode(str));
String milkmanToJson(Milkman data) => json.encode(data.toJson());
class Milkman {
  Milkman(
      {
      this.idmilkman,  
      required this.nombre,
      required this.apellido,
      required this.ci,
      required this.direccion,
      required this.photo,
           });
Milkman.create(this.nombre, this.apellido, this.ci,this.direccion );

  String? idmilkman;   
  String nombre;
  String apellido;
  String ci;
  String direccion;
  String?  photo;
  getNombre() {
    return nombre + " " + apellido;
  }
  factory Milkman.fromJson(Map<String, dynamic> json) => Milkman(
        idmilkman: json["idmilkman"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        ci: json["ci"],
        direccion: json["direccion"],
        photo: json["photo"],
           );
  Map<String, dynamic> toJson() => {
        "idmilkman": idmilkman,
        "nombre": nombre,
        "apellido": apellido,
        "ci": ci,
        "direccion": direccion,
        "photo": photo,

      };
}
