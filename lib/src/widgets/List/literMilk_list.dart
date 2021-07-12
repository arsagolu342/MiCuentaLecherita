import 'package:flutter/material.dart';
import 'package:tu_cuenta_lecherita/src/models/liter_milk_models.dart';
import 'package:tu_cuenta_lecherita/src/services/literMik_services.dart';
 


class LiterMilkList extends StatefulWidget {
  LiterMilkList({Key? key, required this.idmilkman}) : super(key: key);
  final String idmilkman;

  @override
  _LiterMilkListState createState() => _LiterMilkListState();
}

class _LiterMilkListState extends State<LiterMilkList> {
  LiterMilkService _service = new LiterMilkService();
  List<LiterMilk> _liter = [];

  @override
  void initState() {
    super.initState();
    _loadTreatments();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Color(0xFF04B8FF),
      shape: RoundedRectangleBorder(
              side:new  BorderSide(color: Color(0xFFFF6A14)),  
              borderRadius: new BorderRadius.all(new Radius.circular(7))),  
                  child: _liter.length == 0
          ? Container(
             height: 400,
            child: Center(child: Text('Recolectando la Informacion....', textAlign: TextAlign.start, style: TextStyle(color: Colors.blue[900], fontSize: 15),),),
          
          )
          : Column(
              children: _liter
                  .map((e) => ListTile(
                        onTap: () => {},
                        title: Text("Estado" + " " +   e.description.toString()),
                        subtitle:
                            Text("Fecha del ultimo pago" + " " +  e.fechaEntrega.toString()),
                             leading: Container(
                               
                                child: Text("Total a pagar"+ " " + e.subtotalLiter.toString() ),
                                    
                             ),
                      ))
                      
                  .toList(),
            ),
    );
  }

  _loadTreatments() {
    _service.getLiterMilk(widget.idmilkman).then((value) {
      _liter = value;
      setState(() {});
    });
  }
}