import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool _darkMode = false;
  int _selectedPage = 0;

  bool get darkMode {
    return this._darkMode;
  }

  set darkMode(bool value) {
    this._darkMode = value;
    notifyListeners();
  }

  int get selectedPage {
    return this._selectedPage;
  }

  set selectedPage(int value) {
    this._selectedPage = value;
    notifyListeners();
  }
}
