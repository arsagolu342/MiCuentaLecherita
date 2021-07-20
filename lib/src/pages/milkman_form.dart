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
 
  MilkmanService _servicePacient = new MilkmanService();
  //Un objeto del modelo a enviar
  late Milkman _pacient;
  late File _image;
  bool _onSaving = false;
  bool _imageSelected = false;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _pacient = new Milkman.create("nombre"," apellido"," ci", "direccion");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
             
              Container(
                margin: EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        _showImage(),
                        Container(
                          width: 325.0,
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
                    
                    _form()
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _form() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      width: size.width * .85,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Theme.of(context).dividerColor)),
      child: Form(
          key: formKey,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 7.0),
            child: Column(
              children: [
                _inputName(),
                _inputSurname(),
                _inputCity(),
                _inputCi(),
                _buttons()
              ],
            ),
          )),
    ));
  }

  _inputName() {
    return TextFormField(
        initialValue: _pacient.nombre,
        onSaved: (value) {
          _pacient.nombre = value.toString();
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

  _inputSurname() {
    return TextFormField(
        initialValue: _pacient.apellido,
        onSaved: (value) {
          _pacient.apellido = value.toString();
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

  _inputCity() {
    return TextFormField(
        initialValue: _pacient.direccion,
        onSaved: (value) {
          _pacient.direccion = value.toString();
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar un apellido con al menos 3 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Ciudad"),
        maxLength: 25);
  }

     _inputCi() {
    return TextFormField(
        initialValue: _pacient.ci,
        onSaved: (value) {
          _pacient.ci = value.toString();
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar un apellido con al menos 3 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Ciudad"),
        maxLength: 25);
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
              child: Icon(Icons.save),
             
            ),
          );
  }

  _sendForm() async {
    if (!formKey.currentState!.validate()) return;

    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState!.save();

    if (_imageSelected) {
      _pacient.photo = await _servicePacient.uploadImage(_image);
    }

    //Llamamos al servicio para guardar el reporte
    _servicePacient.sendPacient(_pacient).then((value) {
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
    final pickedFile = await _picker.getImage(source: source);
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