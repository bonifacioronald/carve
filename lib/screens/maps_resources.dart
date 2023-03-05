import 'package:carve_app/widgets/maps.dart';
import 'package:flutter/material.dart';

class mapsResources extends StatelessWidget {
  const mapsResources({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MapScreen(),
      )
    );
  }
}