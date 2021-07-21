 
import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    required this.idPayment,
    required this.fechaPago,
    required this.subtotal,
    required this.total,
    required this.idmilkman,
    this.description,
    //si el estado =1 todo, mantienen el valor total, pero si el 0 si=0 y me borra los pago 
  });

  String idPayment;
  String fechaPago;
  String subtotal;
  String total;
  String idmilkman;
  String? description;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        idPayment: json["idPayment"],
        fechaPago: json["fechaPago"],
        subtotal: json["subtotal"],
        total: json["total"],
        idmilkman: json["idmilkman"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "idPayment": idPayment,
        "fechaPago": fechaPago,
        "subtotal": subtotal,
        "total": total,
        "idmilkman": idmilkman,
        "description": description,
      };
}
