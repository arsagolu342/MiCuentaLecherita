import 'package:flutter/material.dart';

import "package:tu_cuenta_lecherita/src/pages/main_pages.dart";
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          
      home:MainPage(titulo: 'Inicio'),
      title: 'Tu Cuenta Lecherita',      
    );
  }
}