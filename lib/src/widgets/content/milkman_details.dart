
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
import 'package:tu_cuenta_lecherita/src/pages/literMilk_form.dart';
import 'package:tu_cuenta_lecherita/src/widgets/List/literMilk_list.dart';
import 'package:tu_cuenta_lecherita/src/widgets/List/pagos_list.dart'; 


class MilkmanDetailsWidget extends StatefulWidget {
  const MilkmanDetailsWidget({Key? key, required this.milkman})
      : super(key: key);
  final Milkman milkman;

  @override
  _MilkmanDetailsWidgetState createState() => _MilkmanDetailsWidgetState();
}

class _MilkmanDetailsWidgetState extends State<MilkmanDetailsWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Detalles'),
    Tab(text: 'Historial de Litros'),
    Tab(text: 'Pagos' ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        labelColor: Theme.of(context).primaryColor,
        controller: _tabController,
        tabs: myTabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_detail(),_historial(), _payments()],
      ),
    );
  }

  _detail() {
    return  Container(
color: Colors.blue[100],      
      margin: EdgeInsets.all(14.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             detalles(context, "Nombre",
                widget.milkman.nombre.toString(), Icons.perm_identity_outlined),
             detalles( context, "Apellido",
                widget.milkman.apellido.toString(), Icons.perm_identity),
            detalles( context, "Numero de Cédula",
                widget.milkman.ci.toString(), Icons.format_list_numbered_outlined),
                detalles( context, "Dirección",
                widget.milkman.direccion.toString(), Icons.streetview_outlined),
          ],
        ),
      ),
      );
  }
_historial(){

   return Column(

     
      children: [

          Expanded(
            child: SingleChildScrollView(
                child: LiterMilkList(idmilkman: widget.milkman.idmilkman.toString()))),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child:  FloatingActionButton(
              onPressed: () => {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LiterMilkForm(idmilkman: widget.milkman.idmilkman.toString()),
                    ))
              },
              child: const Icon(Icons.add_chart_outlined),
              ),
        ),
      ],

      
    );
}
  _payments() {
   
    return Column(
      children: [ 
        Expanded(
            child: SingleChildScrollView(
                child: PaymentList(idmilkman: widget.milkman.idmilkman.toString()))),
                Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child:  FloatingActionButton(
              onPressed: () => {},
              child: const Icon(Icons.payment_outlined),
              ),
        ),
      ],
    );
  }

  detalles(
      BuildContext context, String title, String subtitle, IconData icon) {
    return Expanded(
      child: SingleChildScrollView(
        child: ListTile(
          leading: Icon(icon    
         
          ),
          title: Text(title, style:TextStyle(color: Colors.blue[900])),
          subtitle: Text(subtitle, style:TextStyle(color: Colors.blue)),
        ),
      ),
    );
  }
}