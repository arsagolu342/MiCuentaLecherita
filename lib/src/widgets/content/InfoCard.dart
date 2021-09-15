import 'dart:async';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart';
import 'package:tu_cuenta_lecherita/src/services/milkman_service.dart';

class InfoCard extends StatefulWidget {
  InfoCard({Key? key}) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  final MilkmanService _service = MilkmanService();
  List<Milkman>? _milkman = null;
  Set<Marker> _markers = new Set();

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _centroMulalo = CameraPosition(
    target: LatLng(-0.99021, -78.62868),
    zoom: 20,
  );

  @override
  void initState() {
    super.initState();
    _loadMilkmans();
  }

  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura:$_heigth");

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: _heigth * 0.5,
            child: GoogleMap(
              markers: _markers,
              mapType: MapType.normal,
              initialCameraPosition: _centroMulalo,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            )),
      ],
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




// import 'package:flutter/material.dart';
// import 'package:tu_cuenta_lecherita/src/models/milkman_models-.dart'; 

// class InfoCard extends StatelessWidget {
//   const InfoCard({Key? key, required this.milkman}) : super(key: key);
//   final Milkman milkman;

//   @override
//   Widget build(BuildContext context) {
//     double _heigth = MediaQuery.of(context).size.height;
//     double _width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 SizedBox(
//                   width: _width * 1,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Column(
//                       children: [
//                         Icon(Icons.arrow_back_ios_new_outlined),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Text(
//                   milkman.nombre.toString(),
//                   style: TextStyle(
//                       fontSize: 25,
//                       color: Colors.blue[900],
//                       fontFamily: 'VT323'),
//                 ),
//                 SizedBox(
//                   height: _heigth * 0.4,
//                   child: Container(
//                     color: Color(0xFF04B8FF),
//                     margin: new EdgeInsets.symmetric(horizontal: 20.0),
//                   ),
//                 ),
//                 Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 14.0),
//           child:  FloatingActionButton(
//               onPressed: () => {},
//               child: const Icon(Icons.add_chart_outlined),
//               ),
//         ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
