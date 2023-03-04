import 'package:carve_app/widgets/toggle_button.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class SpecSettingBar extends StatelessWidget {
  String text;

  SpecSettingBar(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          ToggleButton(true),
        ],
      ),
    );
  }
}
