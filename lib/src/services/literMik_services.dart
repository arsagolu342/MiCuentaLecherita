import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tu_cuenta_lecherita/src/models/liter_milk_models.dart';
 
class LiterMilkService {
  LiterMilkService();

  //Future, indica que es una llama asíncrona
  Future<List<LiterMilk>> getLiterMilk(String idmilkman) async {
    List<LiterMilk> items = [];
    try {
      var uri = Uri.https(
         "us-central1-cuentalecherita-f2647.cloudfunctions.net", "api/literMilks/$idmilkman");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final milkman = new LiterMilk.fromJson(item);
        items.add(milkman);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
Future<dynamic> sendLiterMilk(LiterMilk literMilk) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri =
          Uri.https("us-central1-cuentalecherita-f2647.cloudfunctions.net", "/api/literMilks");
      final resp = await http.post(uri,
          headers: _headers, body: literMilkToJson(literMilk));
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

}
