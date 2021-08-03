import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_cuenta_lecherita/src/models/notes_models.dart';
import 'package:tu_cuenta_lecherita/src/providers/note_providers.dart';

class NoteForm extends StatefulWidget {
  NoteForm({Key? key}) : super(key: key);
  

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  //Clave para vincular el Formulario (Form)
  final formKey = GlobalKey<FormState>();
 

  //Un objeto del modelo a enviar
  late Note _element;
  bool _onSaving = false;
  List<String> _noteState = ['Nota resuelta', 'Nota no resuelta'];
  String _typeValue = "";
  @override
  void initState() {
    super.initState();
       _typeValue = _noteState.elementAt(0);
    _element = Note.create("", "", _typeValue == "Nota resuelta");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

          child: CustomPaint(
         
          child: SingleChildScrollView(
      child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [

            Center(
            child :Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Column(
                children: [SizedBox(height: 35.0), _form() ],
              ),
            ),)
          ],
      ),
    ),
        ),),);
  } 
  _form() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            width: size.width * .80,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Theme.of(context).dividerColor)),
            child: Form(
                key: formKey,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
                  child: Column(
                    children: [ 
                      _inputAsunt(),
                      _inputNote(),
                      _inputState(),
                       _buttons()],
                  ),
                )),
          )
        ],
      ),
    );
  } 

  _inputAsunt() {
    return TextFormField(
 initialValue: _element.asunt,
        onSaved: (value) {
          _element.asunt = value.toString();
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar un apellido con al menos 3 caracteres";
          } else {
            return null;
          }
        },
    decoration: InputDecoration(labelText: "Asunto"),
        maxLength: 35);
  } 
   _inputNote() {
    return TextFormField(
        initialValue: _element.note,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.note = value.toString();
        },
        validator: (value) {
          if (value!.length < 5) {
            return "Debe ingresar una descripción con al menos 5 caracteres";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "Nota"),
        
        maxLines: 4);
  }

    Widget _inputState() {
    return Column(
        children: _noteState
            .map((e) => ListTile(
                  title: Text(e),
                  leading: Radio(
                    value: e,
                    groupValue: _typeValue,
                    onChanged: (String? value) {
                      _typeValue = value.toString();
                      _element.active = _typeValue == "Nota resuelta";
                      setState(() {});
                    },
                  ),
                ))
            .toList());
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
               
              },
               child: const Text('Guardar'),
            ),
          );
  }
 
  _sendForm() {
    if (!formKey.currentState!.validate()) return;
    _onSaving = true;
    setState(() {});

    formKey.currentState!.save();

    final fisioProvider =
        Provider.of<NoteProvider>(context, listen: false);
    fisioProvider.addElement(_element.asunt, _element.note, _element.active).then((value) {
      _element = value;
      formKey.currentState!.reset();
      _onSaving = false;
      setState(() {});
    });
  }

  
}
 