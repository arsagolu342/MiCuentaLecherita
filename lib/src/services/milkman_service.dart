import 'dart:convert';
import 'dart:io';
 
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';

class MilkmanService {
  MilkmanService();
  Future<List<Milkman>> getMilkmans() async {
    List<Milkman> items = [];
    try {
      var uri = Uri.https("us-central1-cuentalecherita-f2647.cloudfunctions.net",
          "/api/milkmans/1/100");
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
 Future<dynamic> sendPacient(Milkman milkman) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri =
          Uri.https("us-central1-cuentalecherita-f2647.cloudfunctions.net","/api/milkmans");
      String milkmanJson = milkmanToJson(milkman);
      final resp = await http.post(uri, headers: _headers, body: milkmanJson);
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

    Future<String> uploadImage(File image) async {
   final cloudinary = CloudinaryPublic('dzygpkghm', 'xmax0xkg', cache: false);
   try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );

      return response.secureUrl;
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
      return "";
    }
  }
}
