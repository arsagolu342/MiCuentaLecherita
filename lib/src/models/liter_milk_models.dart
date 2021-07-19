import 'dart:convert'; 
LiterMilk literMilkFromJson(String str) => LiterMilk.fromJson(json.decode(str));

String literMilkToJson(LiterMilk data) => json.encode(data.toJson());

class LiterMilk {
    LiterMilk(
      {
      
       required this.fechaEntrega,
       required this.subtotalLiter,
       required this.totalLiter,
       required this.idmilkman,
      required this.description
    });

  
    LiterMilk.create(this.fechaEntrega, this.subtotalLiter,this.totalLiter, this.idmilkman, this.description);
 
   
    String fechaEntrega;
    String subtotalLiter;
    String totalLiter;
    String idmilkman;
    String  description;


    factory LiterMilk.fromJson(Map<String, dynamic> json) => LiterMilk(
  
        fechaEntrega: json["fechaEntrega"],
        subtotalLiter: json["subtotalLiter"],
        totalLiter: json["totalLiter"],
        idmilkman: json["idmilkman"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
     
        "fechaEntrega": fechaEntrega,
        "subtotalLiter": subtotalLiter,
        "totalLiter": totalLiter,
        "idmilkman": idmilkman,
        "description" :description,
    };
 }
