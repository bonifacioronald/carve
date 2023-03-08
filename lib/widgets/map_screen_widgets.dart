import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
import '/models/colors.dart' as custom_colors;
import 'package:flutter/services.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  bool _isloading = true;
  double _currentLatitude = 0;
  double _currentLongitude = 0;
  Position? position;

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    position = await Geolocator.getCurrentPosition();
  }

  // final position = Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
  // Position _currentPosition;

  late GoogleMapController googleMapController;

  Set<Marker> markers = {};

  @override
  void initState() {
    _determinePosition().then((value) {
      setState(() {
        _currentLatitude = position!.latitude;
        _currentLongitude = position!.longitude;
        _isloading = false;
        markers.add(Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(3.06392335, 101.600783398793)));
      });
    });
    super.initState();
  }

  Widget _loadingScreen() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: custom_colors.backgroundPurple,
      child: Center(
        child: CircularProgressIndicator(
          color: custom_colors.secondaryLightPurple,
        ),
      ),
    );
  }

  // _getCurrentLocation() {
  //   position
  //       .getCurrent(desiredAccuracy: LocationAccuracy.best)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading
          ? _loadingScreen()
          : GoogleMap(
              myLocationEnabled: true,
              scrollGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(3.06392335, 101.600783398793), zoom: 16),
              markers: markers,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                new Factory<OneSequenceGestureRecognizer>(
                  () => new EagerGestureRecognizer(),
                ),
              ].toSet(),
            ),
    );
  }
}
