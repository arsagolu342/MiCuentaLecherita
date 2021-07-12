import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
import 'package:tu_cuenta_lecherita/src/pages/main_pages.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.milkman}) : super(key: key);
  final Milkman milkman;

  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: _width * 1,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPage(titulo: 'Inicio')),
                      );
                    },
                    child: Column(
                      children: [
                        Icon(Icons.arrow_back_ios_new_outlined),
                      ],
                    ),
                  ),
                ),
                Text(
                  milkman.nombre.toString(),
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue[900],
                      fontFamily: 'VT323'),
                ),
                SizedBox(
                  height: _heigth * 0.4,
                  child: Container(
                    color: Color(0xFF04B8FF),
                    margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                ),
                Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child:  FloatingActionButton(
              onPressed: () => {},
              child: const Icon(Icons.add_chart_outlined),
              ),
        ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
