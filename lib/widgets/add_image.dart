import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class AddImageInputButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onCLicked;
  const AddImageInputButton(this.title, this.icon, this.onCLicked, {super.key});

  @override
  State<AddImageInputButton> createState() => _AddImageInputButtonState();
}

class _AddImageInputButtonState extends State<AddImageInputButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onCLicked,
        child: Container(
            width: double.infinity,
            height: 84,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icon,
                      color: custom_colors.secondaryLightPurple,
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: custom_colors.primaryDarkPurple, fontSize: 14),
                    ),
                  ]),
            )));
  }
}

// Widget inputButtons({
//   required String title,
//   required IconData icon,
//   required VoidCallback onCLicked,

// }) => ElevatedButton(

//   style: ElevatedButton.styleFrom(
//     backgroundColor: Colors.white,
//     foregroundColor: Colors.black,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12),
//     ),
//     textStyle: TextStyle(fontSize:20),
//   ),
//   child:Row(children: [
//     Icon(icon),
//     SizedBox(width: 16),
//     Text(title),

//   ],),
//     onPressed: onCLicked,
  

// );