import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';
 
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

  @override
  void initState() {
    super.initState();
    _loadTypeDescription();
    _literMilk = LiterMilk.create(DateFormat.yMMMd().format(_selectedDate), "", "", widget.idmilkman, "Seleccione");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
             
            Column(
              children: [
                SizedBox(height: 35.0),
                SizedBox(
                  height: 120.0,
                  
                ),
                
                _form()
              ],
            )
          ],
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
                     
                      _imputSubtotal(), _inputType(),
                      _inputStartDate(),
                      _buttons()
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
_inputStartDate() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Fecha de inicio", style: Theme.of(context).textTheme.bodyText1),
          DatePickerWidget(
            looping: false, // default is not looping
            firstDate: DateTime(2021), //DateTime(1960),
            dateFormat: "dd-MMMM-yyyy",
            locale: DatePicker.localeFromString('es'),
            onChange: (DateTime newDate, _) {
              _selectedDate = newDate;
              _literMilk.fechaEntrega = _selectedDate.toString();
            },
            pickerTheme: DateTimePickerTheme(
              itemTextStyle: TextStyle(color: Theme.of(context).primaryColor),
              dividerColor: Theme.of(context).disabledColor,
            ),
          )
        ],
      ),
    );
  }
  _imputSubtotal() {
    return TextFormField(
        initialValue: _literMilk.subtotalLiter,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _literMilk.totalLiter = value.toString();
        },
         
        decoration: InputDecoration(labelText: "Litros recolectados el dia de hoy"),
       );
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

  

  _buttons() {
    return Tooltip(
      message: "Guardar",
      child: ElevatedButton(
        onPressed: () {
          _sendForm();
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
      print(value);
    });
  }

  _loadTypeDescription() {
    _serviceTypeDescription.getTypes().then((value) {
      _types = value;
      setState(() {});
    });
  }
}