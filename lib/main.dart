import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_cuenta_lecherita/src/pages/inicio.dart';
import 'package:tu_cuenta_lecherita/src/providers/note_providers.dart';
import 'package:tu_cuenta_lecherita/src/providers/app_providers.dart';
import 'package:tu_cuenta_lecherita/src/utils/app_shared_preferences.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider()),
    ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
  ], child: MyApp()));
 }


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
        create: (BuildContext context) => AppProvider(),
        child: Consumer<AppProvider>(builder: (context, provider, __) {
          getDarkMode().then((value) => provider.darkMode = value);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tu Cuenta Lecherita',
            theme: ThemeData(
                brightness: provider.darkMode == true
                    ? Brightness.dark
                    : Brightness.light,
                primarySwatch: Colors.lightBlue),
                home: Inicio()
          );
        }));
  }
}

 