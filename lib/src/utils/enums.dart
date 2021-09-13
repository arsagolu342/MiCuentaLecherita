import 'package:flutter/material.dart';
import 'dart:convert'; 
import 'package:tu_cuenta_lecherita/src/pages/note_page.dart';
import 'package:tu_cuenta_lecherita/src/pages/settings_page.dart';
import 'package:tu_cuenta_lecherita/src/widgets/content/home_widget.dart'; 
import 'package:tu_cuenta_lecherita/src/widgets/content/lechero_widget.dart';
 
import 'package:google_maps_flutter/google_maps_flutter.dart';
class ItemMenu {
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
  ItemMenu.create(this.icon, this.label);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home,  "Inicio"),
  ItemMenu.create(Icons.people , "Lecheros"),
 ItemMenu.create(Icons.speaker  , "Anotaciones"),
 ItemMenu.create(Icons.settings ,"Configuración"),

];
List<ItemMenu> settingsOptions = [
  ItemMenu(Icons.settings, "Configuración"),
  ItemMenu(Icons.supervised_user_circle, "Créditos")
];

List<Widget> contentWidget = [HomeWidget(), MilkmanWidget(), NotesPage(),SettingsPage()];

 GeoReference geoReferenceFromJson(String str) =>
    GeoReference.fromJson(json.decode(str));

String geoReferenceToJson(GeoReference data) => json.encode(data.toJson());

class GeoReference {
  GeoReference({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory GeoReference.fromJson(Map<String, dynamic> json) => GeoReference(
        lat: json["_latitude"],
        lng: json["_longitude"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };

  LatLng getGeo() {
    return LatLng(lat, lng);
  }
}