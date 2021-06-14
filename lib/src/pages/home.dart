import 'package:flutter/material.dart';

 class HomePage extends StatelessWidget {
  const HomePage({Key? key,   required this.titulo}) : super(key: key);
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titulo),
        ),
        endDrawer: Drawer(
          child: Text(titulo),
        ),
        drawer: Drawer(
          child: Text(titulo),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(label: "Inicio", icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.outbound_outlined), label: "Salir"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Tres")
        ]),
        body: Container(
            child: Column(
          children: [
            Text(titulo, style: Theme.of(context).textTheme.headline1),
         
          ],
        )));
  }
}
