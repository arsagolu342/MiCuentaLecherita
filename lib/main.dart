import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart'; 
import 'package:tu_cuenta_lecherita/src/pages/main_pages.dart';
import 'package:tu_cuenta_lecherita/src/providers/note_providers.dart';
import 'package:tu_cuenta_lecherita/src/providers/app_providers.dart';
import 'package:tu_cuenta_lecherita/src/utils/app_shared_preferences.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider()),
    ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
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
                home: MainPage(titulo: "Inicio")
          );
        }));
        }
      },
    );

  
  }
}
class Splash extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
 
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
                image: AssetImage('assets/images/vaca.png'),
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
 
          ],
        ),
      ),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(Duration(seconds: 7));
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
