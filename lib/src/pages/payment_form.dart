import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:tu_cuenta_lecherita/src/models/description_Payment_model.dart';  
import 'package:tu_cuenta_lecherita/src/models/payment_models.dart';
import 'package:tu_cuenta_lecherita/src/services/descriptionPayment_type.dart';  
import 'package:tu_cuenta_lecherita/src/services/payment_services.dart';

class PaymentForm extends StatefulWidget {
  PaymentForm({Key? key, required this.idmilkman}) : super(key: key);
  final String idmilkman;

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  //Clave para vincular el Formulario (Form)
  final formKey = GlobalKey<FormState>();

  TypeService _serviceTypeDescription = new TypeService();
  PaymentService _paymentService = new PaymentService();
  List<DescriptionPayment> _types = [];
  DateTime _selectedDate = DateTime.now();

  //Un objeto del modelo a enviar
  late Payment _payment;
  bool _onSaving = false;

  @override
  void initState() {
    super.initState();
    _loadTypeTreatments();
    _payment = Payment.create(_selectedDate, widget.idmilkman,"" ,"","Pago Completo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

          child: CustomPaint(
             painter: FondoPaint1(),
          child: SingleChildScrollView(
      child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [

            Center(
            child :Padding(
          padding: const EdgeInsets.symmetric(vertical: 90.0),
              child: Column(
                children: [SizedBox(height: 35.0), _form(),_back()],
              ),
            ),)
          ],
      ),
    ),
        ),),);
  }
 _back(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70.0),
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
                      _inputsubTotal(),
                      _inputTotal(),
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

  _inputsubTotal() {
    return TextFormField(
        initialValue: _payment.subtotal,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _payment.subtotal = value.toString();
        },
        decoration: InputDecoration(labelText: "Valor a pagar"),
        maxLength: 10,
        );
  }
    _inputTotal() {
    return TextFormField(
        initialValue: _payment.total,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _payment.total = value.toString();
        },
        decoration: InputDecoration(labelText: "Valor a pagar"),
        maxLength: 10,
        );
  }



  _inputType() {
    return DropdownButton<String>(
      value: _payment.description,
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
          _payment.description = newValue!;
        });
      },
      items: _types.map<DropdownMenuItem<String>>((DescriptionPayment value) {
        return DropdownMenuItem<String>(
          value: value.nombre,
          child: Text(value.nombre),
        );
      }).toList(),
    );
  }
  _inputFecha() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fecha de Pago",
              style: Theme.of(context).textTheme.subtitle1),
          DatePickerWidget(
            looping: false, // default is not looping
            dateFormat: "yyyy-MMMM-dd",
            locale: DatePicker.localeFromString('es'),
            onChange: (DateTime newDate, _) {
              _selectedDate =  newDate;
              _payment.fechaPago = _selectedDate;
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
               
              },
               child: const Text('Guardar'),
            ),
          );
  }

  _sendForm() async {
    if (!formKey.currentState!.validate()) return;
 _onSaving = true;
                setState(() {});
    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState!.save();

    //Llamamos al servicio para guardar el reporte
    _paymentService.sendPayment(_payment).then((value) {
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
  }}