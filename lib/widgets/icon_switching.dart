import 'package:flutter/material.dart';

class iconSwitching extends StatefulWidget {
  final IconData icon1;
  final IconData icon2;
  final double size1;
  final Color color1;
  const iconSwitching(this.icon1, this.icon2, this.size1, this.color1,
      {super.key});

  @override
  State<iconSwitching> createState() => _iconSwitchingState();
}

class _iconSwitchingState extends State<iconSwitching> {
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlaying = !isPlaying;
        });
      },
      child: Center(
        child: Icon(
          isPlaying ? widget.icon1 : widget.icon2,
          color: widget.color1,
          size: widget.size1,
        ),
      ),
    );
  }
}
