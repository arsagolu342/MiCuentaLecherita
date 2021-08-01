import 'dart:convert';

LiterMilk literMilkFromJson(String str) => LiterMilk.fromJson(json.decode(str));

String literMilkToJson(LiterMilk data) => json.encode(data.toJson());

class LiterMilk {
  LiterMilk(
      {required this.fechaEntrega,
      required this.subtotalLiter,
       this.totalLiter,
      required this.idmilkman,
      required this.description});

  LiterMilk.create(this.fechaEntrega, this.subtotalLiter,
      this.idmilkman, this.description);

  DateTime fechaEntrega;
  String subtotalLiter;
  String? totalLiter;
  String idmilkman;
  String description;

  factory LiterMilk.fromJson(Map<String, dynamic> json) => LiterMilk(
        fechaEntrega: DateTime.parse(json["fechaEntrega"]),
        subtotalLiter: json["subtotalLiter"],
        totalLiter: json["totalLiter"],
        idmilkman: json["idmilkman"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "fechaEntrega":
        "${fechaEntrega.year.toString().padLeft(4, '0')}-${fechaEntrega.month.toString().padLeft(2, '0')}-${fechaEntrega.day.toString().padLeft(2, '0')}",
        "subtotalLiter": subtotalLiter,
        "totalLiter": totalLiter,
        "idmilkman": idmilkman,
        "description": description,
      };
}
