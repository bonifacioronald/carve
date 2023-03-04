
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class ToggleButton extends StatefulWidget {
  bool default_State;
  ToggleButton(this.default_State, {super.key});

  @override
  State<ToggleButton> createState() => ToggleButtonState();
}

class ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoSwitch(
          activeColor: custom_colors.secondaryLightPurple,
          value: widget.default_State,
          onChanged: (bool value) {
            setState(() {
              widget.default_State = value;
            });
          }),
    );
  }
}
