import 'package:carve_app/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../widgets/SettingWidget.dart';
import '../widgets/search_bar.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("First App")),

        body: 
        Container(
          width:double.infinity,
          height:double.infinity,
          padding:EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween
                ,
                children: [
                Icon(Icons.keyboard_arrow_left_sharp),
                Text(
                  'Settings',
                  style:TextStyle(
                    fontSize:24,
                    fontWeight:FontWeight.bold
                  )
                ),

                Icon(Icons.notifications_active)
                

              ]),
             SizedBox(height:30),
             SearchBar("Search setting..."),
             SizedBox(height:30),
             SettingWidget(Icons.account_box,"My account"),
             SettingWidget(Icons.lock,"Privacy"),
             SettingWidget(Icons.map,"Address"),
             SettingWidget(Icons.notifications_active,"Notification"),
             SettingWidget(Icons.question_mark_rounded,"Need Help?"),
             SettingWidget(Icons.chat_bubble_outline,"Help Improve The App"),
             SizedBox(height:70),
             Text("Logins",style:TextStyle(fontSize:16,color:primaryDarkPurple, fontWeight:FontWeight.bold)),
             SettingWidget(Icons.add_box_rounded,"Add account"),
             SettingWidget(Icons.logout,"Log Out"),
             

            ],
          )


        )
        
        







    );
  }
}