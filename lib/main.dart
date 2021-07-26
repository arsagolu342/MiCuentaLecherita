import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/pages/inicio.dart';
import 'package:flutter/services.dart';
 void main() {
//    WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIOverlays(
//       [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:Inicio( ),    
     // home:Ma5inPage(titulo: 'Inicio'),
      title: 'Tu Cuenta Lecherita',      
    );
  }
}