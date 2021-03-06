import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/user_model.dart';
import 'package:tu_cuenta_lecherita/src/providers/login_provider.dart';
import 'package:tu_cuenta_lecherita/src/services/user_service.dart';
class SingUpPage extends StatelessWidget {
  const SingUpPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      
      child: Container(

        
        child: Scaffold(
          body: Container(
            child: Stack(


              
              children: [
                SingleChildScrollView(
                  child: CustomPaint(

                       
                  painter: FondoPaint1(),
               
                    child: Column(
                      children: [
                        SafeArea(
                          
                          child: Container(height: 250.0)
                        
                          ),
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
                                child: Text('Registrarse',
                                    style: Theme.of(context).textTheme.headline6),
                              ),

                              SizedBox(height: 25.0),
                              UsernameSignUpTextControl(),
                              SizedBox(height: 25.0),
                              EmailSignUpTextControl(),
                              SizedBox(height: 25.0),
                              PasswordSignUpTextControl(),
                              SizedBox(height: 25.0),
                              SubmitSignUpButtonControl(),
                              SizedBox(height: 25.0),
                            ]))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class UsernameSignUpTextControl extends StatelessWidget {
  const UsernameSignUpTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.ofSign(context);
    return StreamBuilder(
      stream: bloc.usernameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.person,
                    color: Theme.of(context).primaryColorDark),
                hintText: 'Nombre de usuario',
                labelText: 'Usuario',
                errorText: snapshot.error?.toString()),
            onChanged: bloc.changeUsername);
      },
    );
  }
}

class EmailSignUpTextControl extends StatelessWidget {
  const EmailSignUpTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.ofSign(context);
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.email,
                    color: Theme.of(context).primaryColorDark),
                hintText: 'usuario@dom.com',
                labelText: 'Correo electr??nico',
                errorText: snapshot.error?.toString()),
            onChanged: bloc.changeEmail);
      },
    );
  }
}

class PasswordSignUpTextControl extends StatelessWidget {
  const PasswordSignUpTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.ofSign(context);
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_outline,
                  color: Theme.of(context).primaryColorDark),
              labelText: 'Contrase??a',
              errorText: snapshot.error?.toString()),
        );
      },
    );
  }
}

class SubmitSignUpButtonControl extends StatelessWidget {
  const SubmitSignUpButtonControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserService userService = new UserService();
    final bloc = LoginProvider.ofSign(context);
    return StreamBuilder(
      stream: bloc.formSingUpValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
              child: Text('Registrarme'),
            ),
            onPressed: snapshot.hasData
                ? () async {
                    User user = new User();
                    user.displayName = bloc.username;
                    user.email = bloc.email;
                    user.password = bloc.password;
                    bool create = await userService.sendUser(user);
                    if (create) {
                      Navigator.pop(context);
                    } else {
                      print("Error al crear el usuario");
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

    canvas.drawPath(path, paint); //esto es lo que permite que se dibuje todo
  }
}
