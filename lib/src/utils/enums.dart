import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/pages/note_page.dart';
import 'package:tu_cuenta_lecherita/src/pages/settings_page.dart';
import 'package:tu_cuenta_lecherita/src/widgets/content/home_widget.dart'; 
import 'package:tu_cuenta_lecherita/src/widgets/content/lechero_widget.dart';
 
class ItemMenu {
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
  ItemMenu.create(this.icon, this.label);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home_max_sharp,  "Inicio"),
  ItemMenu.create(Icons.people_alt_sharp, "Lecheros"),
 ItemMenu.create(Icons.speaker_notes_sharp , "Anotaciones"),
 ItemMenu.create(Icons.app_settings_alt_sharp,""),

];

List<Widget> contentWidget = [HomeWidget(), MilkmanWidget(), NotesPage(),SettingsPage()];

