import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:tu_cuenta_lecherita/src/models/description_Payment_model.dart'; 
 
class TypeService {
  TypeService();

  Future<List<DescriptionPayment>> getTypes() async =>
      rootBundle.loadString("assets/data/descriptionPayment_type.json").then((data) {
        List<DescriptionPayment> items = [];
        List<dynamic> jsonList = json.decode(data);
        for (var item in jsonList) {
          final type = new DescriptionPayment.fromJson(item);
          items.add(type);
        }
        return items;
      });
}