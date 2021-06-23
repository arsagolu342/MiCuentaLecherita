import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
class MilkmanService {
  MilkmanService();
    Future<List<Milkman>> getMilkmans() async {
    List<Milkman> items = [];
    try {
      var uri = Uri.https(
          "us-central1-cuentalecherita.cloudfunctions.net", "/api/milkmans/1/100");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final milkman = new Milkman.fromJson(item);
        items.add(milkman);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}
