// To parse this JSON data, do
//
//     final literMilk = literMilkFromJson(jsonString);

import 'dart:convert';

LiterMilk literMilkFromJson(String str) => LiterMilk.fromJson(json.decode(str));

String literMilkToJson(LiterMilk data) => json.encode(data.toJson());

class LiterMilk {
    LiterMilk({
       this.idliterMilk,
       required this.fechaEntrega,
       required this.subtotalLiter,
       required this.totalLiter,
       required this.idmilkman,
       this.description
    });

    String? idliterMilk;
    String fechaEntrega;
    String subtotalLiter;
    String totalLiter;
    String idmilkman;
    String? description;

    factory LiterMilk.fromJson(Map<String, dynamic> json) => LiterMilk(
        idliterMilk: json["idliterMilk"],
        fechaEntrega: json["fecha_entrega"],
        subtotalLiter: json["subtotalLiter"],
        totalLiter: json["totalLiter"],
        idmilkman: json["idmilkman"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "idliterMilk": idliterMilk,
        "fecha_entrega": fechaEntrega,
        "subtotalLiter": subtotalLiter,
        "totalLiter": totalLiter,
        "idmilkman": idmilkman,
        "description" :description,
    };
}
