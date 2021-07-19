import 'package:flutter/material.dart';

class MilkmanForm extends StatefulWidget {
  const MilkmanForm({Key? key}) : super(key: key);

  @override
  _MilkmanFormState createState() => _MilkmanFormState();
}

class _MilkmanFormState extends State<MilkmanForm> {
  @override
  /*void initState() {
    super.initState();
    print("Inicio del estado");
  }
*/
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        child: CustomPaint(
          
          painter: FondoPaint1(),
          child: SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
            
                Text(
                  "Nuevo Lechero",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      height: 2,
                      color: Colors.blue[900],
                      fontFamily: 'VT323'),
                ),
                _formMilkman()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
     
_formMilkman() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SafeArea(child: Container(height: 40.0)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Form(
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 14.0),
            child: Column(
              children: [
                _inputNombre(),
                _inputApellido(),
                _inputCi(),
                _inputDireccion()
              ],
            ),
          )),
        )
      ],
    ),
  );
}

_inputNombre() {
  return TextFormField(
      decoration: InputDecoration(labelText: "Nombres"), maxLength: 35);
}

_inputApellido() {
  return TextFormField(
      decoration: InputDecoration(labelText: "Apellidos"), maxLength: 35);
}

 
_inputCi() {
  return TextFormField(
    decoration: InputDecoration(labelText: "Cédula"),
  );
}

_inputDireccion() {
  return TextFormField(
      decoration: InputDecoration(labelText: "Dirección"),
      maxLength: 255,
      maxLines: 4);
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
