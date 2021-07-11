import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/widgets/content/home_widget.dart'; 
import 'package:tu_cuenta_lecherita/src/widgets/content/lechero_widget.dart';
 
class ItemMenu {
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
  ItemMenu.create(this.icon, this.label);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu.create(Icons.people, "Lecheros"),
 
];

List<Widget> contentWidget = [HomeWidget(), MilkmanWidget()];

