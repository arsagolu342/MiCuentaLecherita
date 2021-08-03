import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_cuenta_lecherita/src/pages/inicio.dart';
import 'package:tu_cuenta_lecherita/src/providers/note_providers.dart';  
 void main() { 
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NoteProvider>(
        create: (_) => NoteProvider()), 
  ], child: MyApp()));
    
   
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
       home:Inicio(),     
      title: 'Tu Cuenta Lecherita',      
    );
  }
}