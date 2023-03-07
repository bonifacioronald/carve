import 'package:flutter/material.dart';

class ContentLibraryCard extends StatelessWidget {
  const ContentLibraryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          width: 100,
          height: 144,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.amber,
          ),
        ),
        SizedBox(height: 20),
      ],
    ));
  }
}
