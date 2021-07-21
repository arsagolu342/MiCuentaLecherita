import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tu_cuenta_lecherita/src/models/payment_models.dart';
 
class PaymentService {
  PaymentService();

  //Future, indica que es una llama asíncrona
  Future<List<Payment>> getPayment(String idmilkman) async {
    List<Payment> items = [];
    try {
      var uri = Uri.https(
         "us-central1-cuentalecherita.cloudfunctions.net", "/api/payments/$idmilkman");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final milkman = new Payment.fromJson(item);
        items.add(milkman);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
   Future<List<Payment>> getPaymentList() async {
    List<Payment> items = [];
    try {
      var uri = Uri.https("us-central1-cuentalecherita.cloudfunctions.net",
          "/api/payments/1/100");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final payment = new Payment .fromJson(item);
        items.add(payment);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}
