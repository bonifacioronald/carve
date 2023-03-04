import 'package:carve_app/models/colors.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';


class SettingWidget extends StatelessWidget {
  IconData icon;
  String text;

  SettingWidget(this.icon,this.text);


  @override
  Widget build(BuildContext context) {
    return Container(
      height:50,
      width:double.infinity,
      child: 
        Row(
          
          children: [
            Container(child:
              Row(children:[
                Icon(icon, color: primaryDarkPurple),
              SizedBox(width:20),
              Text(text,
                  style:TextStyle(
                    color:primaryDarkPurple,
                    fontSize:14,
                    fontWeight:FontWeight.bold
                        )),
              ]
            )
            ),
            Spacer(),
            
            
             
              Icon(Icons.keyboard_arrow_right_sharp, color: primaryDarkPurple,)
            
          
            
        ],
        )



    ,




    );
  }
}