import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:tu_cuenta_lecherita/src/pages/login.dart';
import 'package:tu_cuenta_lecherita/src/pages/main_pages.dart'; 
import 'package:tu_cuenta_lecherita/src/pages/settings_page.dart';
import 'package:tu_cuenta_lecherita/src/pages/singup.dart';
import 'package:tu_cuenta_lecherita/src/providers/login_provider.dart';
import 'package:tu_cuenta_lecherita/src/providers/note_providers.dart';
import 'package:tu_cuenta_lecherita/src/providers/app_providers.dart'; 
import 'package:tu_cuenta_lecherita/src/utils/user_shared_preferences.dart';

Future<void> main() async {
   
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Preferences().init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider()),
    ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
  ], child: MyApp()));
}
//await Preferences().init();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final prefs = new Preferences();
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: true);
    appProvider.init(prefs.token, prefs.mode);
    return FutureBuilder(
    
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: MainPage(titulo: "Tu Cuenta Lecherita"));
        } else {
          // Loading is done, return the app:
          // return ChangeNotifierProvider<AppProvider>(
          //     create: (BuildContext context) => AppProvider(),
          //     child: Consumer<AppProvider>(builder: (context, provider, __) {
          //       getDarkMode().then((value) => provider.darkMode = value);

                return LoginProvider(
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Tu Cuenta Lecherita',
                    home: appProvider.token == ""
                        ? const LoginPage()
                        : JwtDecoder.isExpired(appProvider.token)
                            ? const LoginPage()
                            : const MainPage(titulo: "Tu Cuenta Lecherita"),
                    routes: {
                      "/login": (context) => const LoginPage(),
                      "/singUp": (context) => const SingUpPage(),
                      "/settings": (context) => const SettingsPage(),
                    },

                    theme: ThemeData(
                       brightness: appProvider.darkMode == true
                    ? Brightness.dark
                    : Brightness.light,
                primarySwatch: Colors.lightBlue),
                    // home: MainPage(titulo: "Inicio")
                  ),
                );
              //
             // );
              //);
        }
      },
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
