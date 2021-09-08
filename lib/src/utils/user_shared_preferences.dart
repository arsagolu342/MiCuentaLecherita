import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = new Preferences._internal();

  factory Preferences() {
    return _instance;
  }

  Preferences._internal();

  late SharedPreferences _prefs;

  init() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  bool get mode {
    return _prefs.getBool('mode') ?? false; //No es modo nocturo
  }

  set mode(bool value) {
    _prefs.setBool('mode', value);
  }

  String get token {
    return _prefs.getString('token') ?? "";
  }

  set token(String value) {
    _prefs.setString('token', value);
  }
}