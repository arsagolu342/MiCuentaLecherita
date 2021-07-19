import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:tu_cuenta_lecherita/src/models/description_model.dart';
 
class DescriptionTypeService {
  DescriptionTypeService();

  Future<List<Description>> getTypes() async =>
      rootBundle.loadString("assets/data/descriptionPay_type.json").then((data) {
        List<Description> items = [];
        List<dynamic> jsonList = json.decode(data);
        for (var item in jsonList) {
          final type = new Description.fromJson(item);
          items.add(type);
        }
        return items;
      });
}