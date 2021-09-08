import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_cuenta_lecherita/src/providers/app_providers.dart';
import 'package:tu_cuenta_lecherita/src/providers/login_provider.dart';
import 'package:tu_cuenta_lecherita/src/services/user_service.dart';
import 'package:tu_cuenta_lecherita/src/utils/standar_widfets.dart'; 

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
        body: Container(       
         child: Stack(
            children: [
              Container(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: CustomPaint(
                  painter: FondoPaint1(),
                ),
              ),
            ),
              BackgroundWidget(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SafeArea(child: Container(height: 180.0)),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        width: size.width * .80,
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  blurRadius: 2.0,
                                  offset: Offset(0.0, 1.0),
                                  spreadRadius: 2.0)
                            ]),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Text('Inicio de sesión',
                                style: Theme.of(context).textTheme.headline6),
                          ),
                          SizedBox(height: 25.0),
                          EmailTextControl(),
                          SizedBox(height: 25.0),
                          PasswordTextControl(),
                          SizedBox(height: 25.0),
                          SubmitButtonControl(),
                          SizedBox(height: 25.0),
                        ])),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/singUp");
                        },
                        child: Text("Registrarse"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EmailTextControl extends StatelessWidget {
  const EmailTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.email,
                    color: Theme.of(context).primaryColorDark),
                hintText: 'usuario@dominio.com',
                labelText: 'Correo electrónico',
                errorText: snapshot.error?.toString()),
            onChanged: bloc.changeEmail);
      },
    );
  }
}

class PasswordTextControl extends StatelessWidget {
  const PasswordTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_outline,
                  color: Theme.of(context).primaryColorDark),
              labelText: 'Contraseña',
              errorText: snapshot.error?.toString()),
        );
      },
    );
  }
}

class SubmitButtonControl extends StatelessWidget {
  const SubmitButtonControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    UserService userService = new UserService();
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
              child: Text('Ingresar'),
            ),
            onPressed: snapshot.hasData
                ? () async {
                    Map info =
                        await userService.login(bloc.email, bloc.password);

                    if (info['ok']) {
                      appProvider.token = info['token'];
                    } else {
                      print(info['message']);
                    }
                  }
                : null);
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
