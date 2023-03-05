
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const initialPosition = CameraPosition(
    target: LatLng(3.07166638, 101.587997648),
    zoom: 10.0,
  );
//   void _addMarker(LatLng pos){
//   if(_origin == null || (_origin!=null && _destination!=null)){
//     setState(() {
//       _origin = Marker(
//         markerId: MarkerId('origin'),
//         position: pos,
//         infoWindow: InfoWindow(
//           title: 'Origin',
//           snippet: 'This is where you start from',
//         ),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//       );
//     });
// }else{
//   setState(() {
//     _destination = Marker(
//       markerId: MarkerId('destination'),
//       position: pos,
//       infoWindow: InfoWindow(
//         title: 'Destination',
//         snippet: 'This is where you end up',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//     );
//   });
// }
// }
  late GoogleMapController _mapController;
  // late Marker _origin;
  // late Marker _destination;
  @override
  void dispose() {
     _mapController.dispose();
  super.dispose();
}
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (controller) {
          _mapController = controller;
        },
        markers: {
          // if(_origin!= null) _origin,
          // if(_destination!= null) _destination,
        },
        // onLongPress: _addMarker,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () =>
            _mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                initialPosition
                )
              ),
              child: Icon(Icons.center_focus_strong),
            ),
            );
          }
  }

