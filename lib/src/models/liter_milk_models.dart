// To parse this JSON data, do
//
//     final literMilk = literMilkFromJson(jsonString);

import 'dart:convert';

LiterMilk literMilkFromJson(String str) => LiterMilk.fromJson(json.decode(str));

String literMilkToJson(LiterMilk data) => json.encode(data.toJson());

class LiterMilk {
    LiterMilk({
        required this.fechaEntrega,
        required this.subtotalLiter,
        required this.totalLiter,
    });

    DateTime fechaEntrega;
    String subtotalLiter;
    String totalLiter;

    factory LiterMilk.fromJson(Map<String, dynamic> json) => LiterMilk(
        fechaEntrega: json["fecha_entrega"],
        subtotalLiter: json["subtotalLiter"],
        totalLiter: json["totalLiter"],
    );

    Map<String, dynamic> toJson() => {
        "fecha_entrega": fechaEntrega,
        "subtotalLiter": subtotalLiter,
        "totalLiter": totalLiter,
    };
}
