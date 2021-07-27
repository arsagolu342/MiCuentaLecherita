import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/pages/main_pages.dart';

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    // double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Stack(


          
          children: <Widget>[
            Container(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: CustomPaint(
                  painter: FondoPaint1(),
                ),
              ),
            ),
            Center(
              child: Image(
                image: AssetImage('../assets/images/vaca.png'),
                height: 300,
              ),
            ),
          
            ListTile(
              title: Text(
                "Tu Cuenta Lecherita",
                textAlign: TextAlign.center,
                style: TextStyle(height: 7, color: Colors.black,fontFamily: "Trajan Pro", fontSize: 35),
              ),
            ),

              Container(
               alignment:Alignment.centerRight,
                child: SizedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPage(titulo: 'Inicio')),
                    );
                  },
                  child: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                height: 900,
            ),
              ),
          ],
        ),
      ),
    );
  }
}

class FondoPaint1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    curva1(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void curva1(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color(0xFF0059FD);
    paint.style = PaintingStyle
        .fill; // .stroke es para dibujar una linea y  .fill es para pintar todo
    paint.strokeWidth = 10.0;

    final path = new Path();

    /*
    (0,0)-(0,size.heigth)-(size.width,size.heigth)-(size.width,0)
     */

    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.17,
        size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.27, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.moveTo(0, size.height * 0.9); //salto del pincel o lapiz
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.2, size.height * 0.88, 0, size.height * 0.9);

    canvas.drawPath(path, paint); //esto es lo que permite que se dibuje todo
  }
}
