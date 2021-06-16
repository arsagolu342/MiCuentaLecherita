import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/utils/enums.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  _MainPageState createState() => _MainPageState();
}

class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.white;
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();

    paint.color = Colors.blue.shade900;
    canvas.drawPath(ovalPath, paint);

    ovalPath.lineTo(0, size.height * 0.090);
    ovalPath.quadraticBezierTo(size.width * 0.07, size.height * 0.07,
        size.width * 0.49, size.height * 0.05);
    ovalPath.quadraticBezierTo(size.width * 0.78, size.height * 0.049,
        size.width, size.height * 0.090);
    ovalPath.lineTo(size.width, 0);
    ovalPath.lineTo(0, 0);

    canvas.drawPath(
        ovalPath, paint); //esto es lo que permite que se dibuje todo
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  get contentWidget => null;

  @override
  void initState() {
    super.initState();
    print("Inicio del estado");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      /*
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 14.0),
          child: contentWidget[_selectedIndex]
          
          ),*/
      
      body: Stack(
       
        children: <Widget>[
            Text(_selectedIndex == 0
            ? widget.titulo: menuOptions[_selectedIndex].label,  textAlign: TextAlign.center,
     style:TextStyle( fontSize: 40,height: 3, color: Colors.blue[900],  fontFamily: 'Karla'
      ),
    ),
    // Solid text as fill.
       
         Opacity(
           
            opacity:0.8,
            child: Container(
              
              height: double.infinity,
              width: double.infinity,
              
              child: CustomPaint(painter: FondoPaint1(),),
                
            ),
          ),
          
        ],
           
      ),
     
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.blue,
          currentIndex: _selectedIndex,
          onTap: (value) {
            _selectedIndex = value;
            setState(() {
              print("Cambio del estado");
            });
          },
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.label, backgroundColor: Colors.white))
              .toList()),
    );
  }
}

class FondoPaint1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.white;
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();

    paint.color = Colors.blue.shade900;
    canvas.drawPath(ovalPath, paint);

    ovalPath.lineTo(0, size.height * 0.090);
    ovalPath.quadraticBezierTo(size.width * 0.07, size.height * 0.07,
        size.width * 0.49, size.height * 0.05);
    ovalPath.quadraticBezierTo(size.width * 0.78, size.height * 0.049,
        size.width, size.height * 0.090);
    ovalPath.lineTo(size.width, 0);
    ovalPath.lineTo(0, 0);

    canvas.drawPath(
        ovalPath, paint); //esto es lo que permite que se dibuje todo
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}