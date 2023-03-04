import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class IconSwitchingButton extends StatefulWidget {
  final IconData icon1;
  final IconData icon2;
  const IconSwitchingButton(this.icon1, this.icon2, {super.key});

  @override
  State<IconSwitchingButton> createState() => _IconSwitchingButtonState();
}

bool isPlaying = true;

class _IconSwitchingButtonState extends State<IconSwitchingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
      height: 40,
      width: 40,
      child: FittedBox(
        child: Center(
          child: FloatingActionButton.small(
            backgroundColor: custom_colors.primaryDarkPurple,
            onPressed: () {
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            child: Center(
                child: Icon(
              isPlaying ? widget.icon1 : widget.icon2,
              color: Colors.white,
            )),
          ),
        ),
      ),
    ));
  }
}