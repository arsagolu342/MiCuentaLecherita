import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
import 'package:tu_cuenta_lecherita/src/services/milkman_service.dart';
import 'package:tu_cuenta_lecherita/src/widgets/content/milkman_details.dart';

class MilkmanPage extends StatefulWidget {
  const MilkmanPage({Key? key, required this.milkman}) : super(key: key);
  final Milkman milkman;

  @override
  _MilkmanPageState createState() => _MilkmanPageState();
}

class _MilkmanPageState extends State<MilkmanPage> {


  final MilkmanService _service = MilkmanService();
  List<Milkman>? _milkman = null;
  Set<Marker> _markers = new Set();

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kCentroLatacunga = CameraPosition(
    //centro de recoleccion de leche 
    target: LatLng(-0.90975, -78.62868),
    zoom: 18,
  );

  @override
  void initState() {
    super.initState();
    _loadMilkmans();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _appBar(),
        SliverFillRemaining(
            child: MilkmanDetailsWidget(milkman: widget.milkman))
      ],
    ));
  }

  _appBar() {
     double _heigth = MediaQuery.of(context).size.height;
    print("Altura:$_heigth");
    return SliverAppBar(
      title: Text(
        widget.milkman.nombre + " " + widget.milkman.apellido,
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
      expandedHeight: 500.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: Column(
           
           mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [   SizedBox(
              height: _heigth * 0.53,
              child: GoogleMap(
                markers: _markers,
                mapType: MapType.normal,
                initialCameraPosition: _kCentroLatacunga,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              )
              
              ),
         
          
      ],
     //
          ),
        ),
      ),
    );
  }

  _loadMilkmans() {
    _service.getMilkmans().then((value) {
      _milkman = value;
      _milkman!.forEach((element) {
        if (element.georeference != null) {
          Marker mark = new Marker(
              markerId: MarkerId(element.nombre),
              infoWindow: InfoWindow(title: element.nombre),
              position: element.georeference!.getGeo());
          _markers.add(mark);
        }
      });

      if (mounted) {
        setState(() {});
      }
    });
  }
}

// Pagina que se muestra al dar click al nombre del lechero
