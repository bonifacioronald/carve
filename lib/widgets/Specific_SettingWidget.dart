import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import 'SpecificSettingBar.dart';

class SpecSetting extends StatelessWidget {
  String title;
  String subtitle;

    SpecSetting(this.title,this.subtitle);


  @override
  Widget build(BuildContext context) {
    return Container(
        padding:EdgeInsets.all(10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:70),
            Center(child:Text (
              title,style:TextStyle(fontSize:36,fontWeight:FontWeight.bold)),
            ),
            SizedBox(height:20),
            Container(height:1,color:Colors.grey),
            SizedBox(height:20),
            Text(subtitle,style:TextStyle(fontSize:16,fontWeight:FontWeight.bold)),
            SpecSettingBar("All Notifications"),
            
            




        ],)


    );
  }
}