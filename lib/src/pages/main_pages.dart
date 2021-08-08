import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/pages/milkman_form.dart';
import 'package:tu_cuenta_lecherita/src/utils/enums.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  int _selectedIndex = 0;
  @override
  /*void initState() {
    super.initState();
    print("Inicio del estado");
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       floatingActionButton: _selectedIndex == 1
          ? Container(
           
              child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MilkmanForm(),
                        ));
                  },
                  child: const Icon(Icons.add),
                ),
           
                

              
          )
  
          : null,
          
          
      body: Container(

        
        child: CustomPaint(
          painter: FondoPaint1(),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  
                  Text(
                    _selectedIndex == 0
                        ? widget.titulo
                        : menuOptions[_selectedIndex].label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        height: 3,
                        color: Colors.white,
                        fontFamily: 'VT323'),
                  ),
                  Container (
                    height: 795.0,
                    margin: EdgeInsets.symmetric(horizontal: 14.0),
                    child: Container(
                      child: contentWidget[_selectedIndex],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue[900],
          selectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: (value) {
            _selectedIndex = value;
            setState(() {
              print("Cambio del estado");
            });
          },
          items: menuOptions
              .map((e) => BottomNavigationBarItem(
                  icon: Icon(e.icon),
                  label: e.label,
                  backgroundColor: Colors.white))
              .toList()),
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

    canvas.drawPath(path, paint); //esto es lo que permite que se dibuje todo
  }
}
