import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tu_cuenta_lecherita/src/models/user_model.dart';
import 'package:tu_cuenta_lecherita/src/utils/user_shared_preferences.dart'; 

class UserService {
  final String _firebaseAPIKey = 'AIzaSyA72y3u87TrtlASF01Z0LIkbRBAYU2WuMk';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final queryParams = {"key": _firebaseAPIKey};

    var uri = Uri.https("www.googleapis.com",
        "/identitytoolkit/v3/relyingparty/verifyPassword", queryParams);

    final resp = await http.post(uri, body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      final prefs = new Preferences();
      prefs.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'message': decodedResp['error']['message']};
    }
  }

  Future<bool> sendUser(User user) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri =
          Uri.https("us-central1-cuentalecherita-f2647.cloudfunctions.net", "/api/auth/signup");
      String userJson = userToJson(user);
      final Response resp =
          await http.post(uri, headers: _headers, body: userJson);
      if (resp.body.isEmpty) return false;
      if (resp.statusCode == 201)
        return true;
      else
        return false;
    } on Exception catch (e) {
      print("Exception $e");
      return false;
    }
  }
}