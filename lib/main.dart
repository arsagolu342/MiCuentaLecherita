import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:tu_cuenta_lecherita/src/pages/login.dart';
import 'package:tu_cuenta_lecherita/src/pages/main_pages.dart'; 
import 'package:tu_cuenta_lecherita/src/pages/settings_page.dart';
import 'package:tu_cuenta_lecherita/src/pages/shortcuts.dart';
import 'package:tu_cuenta_lecherita/src/pages/singup.dart';
import 'package:tu_cuenta_lecherita/src/providers/login_provider.dart';
import 'package:tu_cuenta_lecherita/src/providers/note_providers.dart';
import 'package:tu_cuenta_lecherita/src/providers/app_providers.dart'; 
import 'package:tu_cuenta_lecherita/src/utils/user_shared_preferences.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}
late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


Future<void> main() async {
   
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
     await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
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

class MyApp extends StatefulWidget {

  String shortcut = 'no action set';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final prefs = new Preferences();
  final quickActions = QuickActions();
  String shortcut = 'no action set';

@override
  void initState() {
    super.initState();
    initQuickActions();
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      print('An initial message event was published!');
    });

 FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('A new onMessage event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: 'ortopedica',
              ),
            ));
      }

      print(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print(message);
    });
  }
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

   void initQuickActions() {
    quickActions.initialize((type) {
      if (type == null) return;

      if (type == ShortcutItems.actionCreate.type) {
        print('Pressed: Search');
      } else if (type == ShortcutItems.actionTask.type) {
        print('Pressed: Task');
      }

      setState(() {
        shortcut = type;
      });
    });

    quickActions.setShortcutItems(ShortcutItems.items);
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
