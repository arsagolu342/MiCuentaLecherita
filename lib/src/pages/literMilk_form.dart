import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:tu_cuenta_lecherita/src/models/description_model.dart';
import 'package:tu_cuenta_lecherita/src/models/liter_milk_models.dart';
import 'package:tu_cuenta_lecherita/src/services/description_type_service.dart';
import 'package:tu_cuenta_lecherita/src/services/literMik_services.dart';    

class LiterMilkForm extends StatefulWidget {
  LiterMilkForm({Key? key, required this.idmilkman}) : super(key: key);
  final String idmilkman;

  @override
  _LiterMilkFormState createState() => _LiterMilkFormState();
}

class _LiterMilkFormState extends State<LiterMilkForm> {
  //Clave para vincular el Formulario (Form)
  final formKey = GlobalKey<FormState>();

  DescriptionTypeService _serviceTypeDescription = new DescriptionTypeService();
  LiterMilkService _literMilkservice = new LiterMilkService();
  List<Description> _types = [];
  DateTime _selectedDate = DateTime.now();

  //Un objeto del modelo a enviar
  late LiterMilk _literMilk;
  bool _onSaving = false;

  @override
  void initState() {
    super.initState();
    _loadTypeTreatments();
    _literMilk = LiterMilk.create( _selectedDate , "" , widget.idmilkman, "Litros completos");}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         
        body: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
            
              Column(
                children: [
                  SizedBox(height: 35.0),
                
              
                  _form()
                ],
              )
            ],
          ),
        ));
  }

  _form() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            width: size.width * .80,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Theme.of(context).dividerColor)),
            child: Form(
                key: formKey,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 32.0, horizontal: 14.0),
                  child: Column(
                    children: [
                      _inputType(),
                      _inputSubtotal(),
                      _inputFecha(),
                      _buttons()
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  _inputSubtotal() {
    return TextFormField(
        initialValue: _literMilk.subtotalLiter,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _literMilk.subtotalLiter = value.toString();
        }, 
        decoration: InputDecoration(labelText: "Litros del día"),
        maxLength: 255,
        maxLines: 4);
  }

  _inputType() {
    return DropdownButton<String>(
      value: _literMilk.description,
      icon: const Icon(Icons.expand_more),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      underline: Container(
        height: 2,
        color: Theme.of(context).dividerColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          _literMilk.description = newValue!;
        });
      },
      items: _types.map<DropdownMenuItem<String>>((Description value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Text(value.name),
        );
      }).toList(),
    );
  }

  _inputFecha() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fecha de entrega", style: Theme.of(context).textTheme.subtitle1),
          DatePickerWidget(
            looping: false, // default is not looping
            dateFormat: "yyyy-MMMM-dd",
            locale: DatePicker.localeFromString('es'),
            onChange: (DateTime newDate, _) {
              _selectedDate = newDate;
              _literMilk.fechaEntrega = _selectedDate;
            },
            pickerTheme: DateTimePickerTheme(
              backgroundColor: Theme.of(context).canvasColor,
              itemTextStyle: TextStyle(color: Theme.of(context).primaryColor),
              dividerColor: Theme.of(context).disabledColor,
            ),
          )
        ],
      ),
    );
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

    //Llamamos al servicio para guardar el reporte
    _literMilkservice.sendLiterMilk(_literMilk).then((value) {
      formKey.currentState!.reset();
      Navigator.pop(context);
    });
  }

  _loadTypeTreatments() {
    _serviceTypeDescription.getTypes().then((value) {
      _types = value;
      setState(() {});
    });
  }
}