 
import 'dart:convert';

import 'dart:ffi';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
    Payment({
        required this.fechaPago,
        required this.subtotal,
        required this.total,
    });

    DateTime fechaPago;
    Float subtotal;
    Float total;

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        fechaPago: json["fecha_pago"],
        subtotal: json["subtotal"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "fecha_pago": fechaPago,
        "subtotal": subtotal,
        "total": total,
    };
}
