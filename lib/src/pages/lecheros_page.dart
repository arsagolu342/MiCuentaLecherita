import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';

class LecherosPage extends StatefulWidget {
  LecherosPage({Key? key, required this.milkman}) : super(key: key);
final Milkman milkman;
  @override
  _LecherosPageState createState() => _LecherosPageState();
}

class _LecherosPageState extends State<LecherosPage> {
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;

    
            return Scaffold(
            
            
            body: Container(



              child: CustomPaint(
                painter: FondoPaint1(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                       
                      Container(
                        
                        height:40.0,
                        margin: EdgeInsets.symmetric(horizontal: 14.0),
                           child: ListTile(
             
            
    ),
                     ), 
                  
               
                SizedBox(
              height: _heigth * 0.4,
              child: Container(color: Color(0xFF04B8FF), margin: new EdgeInsets.symmetric(horizontal: 20.0),),
              
            ),
              ],
            ),
          ),
        ),

       
      ),
      
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
