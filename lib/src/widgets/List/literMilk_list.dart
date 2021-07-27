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
  List<LiterMilk>? _liter = [];

  @override
  void initState() {
    super.initState();
    _loadTreatments();
  }

  @override
  Widget build(BuildContext context) {
    return _liter == null
        ? reload(" Descargando la información..."):
        _liter!.length == 0
      ?  reload(" No hay Litros registrados")
    : Card(
      color:  Color(0xFF04B8FF),
      shape: RoundedRectangleBorder(
             
              side:new  BorderSide(color: Color(0xFFFF6A14)),  
              borderRadius: new BorderRadius.all(new Radius.circular(7))), 
               
                  child: _liter!.length == 0
          ? Container(
             height: 400,
            child: Center(child: Text('Recolectando la Informacion....', textAlign: TextAlign.start, style: TextStyle(color: Colors.blue[900], fontSize: 15),),),
          
          )
          
          : Container(
            child: Column(
                
                
                children: _liter!
                
                    .map((e) => ListTile(
                          onTap: () => {},
                          title: Text( " " + e.description.toString(),style: TextStyle(color: Colors.white, fontSize: 15), ),
                          subtitle:
                              Text("Fecha de la ultima recolección: " + " " +  e.fechaEntrega.toString(),style: TextStyle(color: Colors.white, fontSize: 15),),
                               leading: Container(
                                 
                                  child: Text("Litros : " + " " +   e.subtotalLiter.toString(),style: TextStyle(color: Colors.blueGrey, fontSize: 15),),
                                       
                               ),
                              //   trailing: Column(
                              //  children: [
                              //      Container(
                              //     child: Card(
                              //         color:  Color(0xFF94E1FF),
                              //         child:  Text("Total de litros:" + " "+ e.totalLiter.toString())
                                        
                              //     ),
                              //   ),

                              //  ],
                              // ),

                        ))
                        
                    .toList(),
                   


              ),

               
          ),
            

    );
  }

  _loadTreatments() {
    _service.getLiterMilk(widget.idmilkman).then((value) {
      _liter = value;
      setState(() {});
    });
  }
reload(  String message,) {
    return Container(
      margin: EdgeInsets.all(14.0),
      child: Center(
        child: Card(
            margin: EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                 Image.asset("../assets/images/leche.jpg", width: 100,),
                    Container(
                  margin: EdgeInsets.all(20.0),
                  child: Text(message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1),
                ),           
                    
              ],
            )),
      ),
    );
  }

}