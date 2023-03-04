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
      padding:EdgeInsets.only(right: 20),
      height:50,
      child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(child:
              Row(children:[Icon(icon),
              SizedBox(width:10),
              Text(text,
                  style:TextStyle(
                    color:primaryDarkPurple,
                    fontSize:14,
                    fontWeight:FontWeight.bold
                        )),
              ]
            )
            ),
            Container(child:
            Row(
              children:[
              Icon(Icons.keyboard_arrow_right_sharp)
            ]
          )
            )
        ],
        )



    ,




    );
  }
}