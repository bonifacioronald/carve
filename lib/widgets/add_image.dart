import 'package:flutter/material.dart';
class inputButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onCLicked;
  const inputButton(this.title,this.icon,this.onCLicked,{super.key});

  @override
  State<inputButton> createState() => _inputButtonState();
}

class _inputButtonState extends State<inputButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCLicked,
      child: Container(
        width: 168,
        height: 84,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          
        ),
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Icon(widget.icon),
          SizedBox(width: 12),
          Text(widget.title),
          ]
              ),
        )
      ));
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