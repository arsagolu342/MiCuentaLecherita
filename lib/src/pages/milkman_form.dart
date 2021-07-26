import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
import 'package:tu_cuenta_lecherita/src/services/milkman_service.dart';

class MilkmanForm extends StatefulWidget {
  MilkmanForm({Key? key}) : super(key: key);

  @override
  _MilkmanFormState createState() => _MilkmanFormState();
}

class _MilkmanFormState extends State<MilkmanForm> {
  final formKey = GlobalKey<FormState>();

  MilkmanService _milkmanService = new MilkmanService();
  //Un objeto del modelo a enviar
  late Milkman _milkman;
  late File _image;
  bool _onSaving = false;
  bool _imageSelected = false;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _milkman = new Milkman.create("", "", "", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Container(
         
        
        child: CustomPaint(
          painter: FondoPaint1(),
          child: SingleChildScrollView(
            child: Container(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                           padding: const EdgeInsets.symmetric(vertical: 90.0),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                _showImage(),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [


                                      Tooltip(
                                        message: "Tomar foto",
                                        child: ElevatedButton(
                                          onPressed: _takeImage,
                                          child: Icon(Icons.camera_alt),
                                        ),
                                      ),
                                      Tooltip(
                                        message: "Buscar foto",
                                        child: ElevatedButton(
                                          onPressed: _pickImage,
                                          child: Icon(Icons.image),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          _form()
                          ,_back()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      
    ));
  }
  _back(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: ElevatedButton(

 onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_back_ios_new_outlined),
                        ],
                      ),

      ),
    );
  }

  _form() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Container(
      width: size.width * .85,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Form(
          key: formKey,
          child: Container(
            child: Column(
              children: [
                _inputNombre(),
                _inputApellido(),
                _inputCi(),
                _inputDireccion(),
                 _buttons()
              ],
            ),
          )),
    ));
  }

  _inputNombre() {
    return TextFormField(
        initialValue: _milkman.nombre,
        onSaved: (value) {
          _milkman.nombre = value.toString();
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar un nombre con al menos 3 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Nombres"),
        maxLength: 35);
  }

  _inputApellido() {
    return TextFormField(
        initialValue: _milkman.apellido,
        onSaved: (value) {
          _milkman.apellido = value.toString();
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar un apellido con al menos 3 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Apellidos"),
        maxLength: 35);
  }

  _inputDireccion() {
    return TextFormField(
        initialValue: _milkman.direccion,
        onSaved: (value) {
          _milkman.direccion = value.toString();
        },
        validator: (value) {
          if (value!.length < 5) {
            return "Debe ingresar una direccion con al menos 5 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Dirección"),
        maxLength: 25);
  }

  _inputCi() {
    return TextFormField(
        initialValue: _milkman.ci,
        onSaved: (value) {
          _milkman.ci = value.toString();
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar un numero de cedula de 10 digitos";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Cédula"),
        maxLength: 10);
  }

  _buttons() {
    return _onSaving
        ? Container(
            height: 50.0,
            width: 50.0,
            child: Center(child: CircularProgressIndicator()))
        : Tooltip(
            message: "Guardar",
            child: ElevatedButton(
              onPressed: () {
                _sendForm();
                _onSaving = true;
                setState(() {});
              },
              child: const Text('Guardar'),
            ),
          );
  }

  _sendForm() async {
    if (!formKey.currentState!.validate()) return;

    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState!.save();

    if (_imageSelected) {
      _milkman.photo = await _milkmanService.uploadImage(_image);
    }

    //Llamamos al servicio para guardar el reporte
    _milkmanService.sendPacient(_milkman).then((value) {
      formKey.currentState!.reset();
      Navigator.pop(context);
    });
  }

_showImage() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Theme.of(context).canvasColor),
      child: ClipOval(
          child: _imageSelected == false
              ? Image.asset("assets/images/user.png")
              : Image.file(_image)),
    );
  }

  _takeImage() {
    _selectImage(ImageSource.camera);
  }

  _pickImage() {
    _selectImage(ImageSource.gallery);
  }

  Future _selectImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _imageSelected = true;
    } else {
      print('No image selected.');
      _imageSelected = false;
    }
    setState(() {});
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
