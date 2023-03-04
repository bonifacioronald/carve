import 'package:carve_app/models/colors.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'WelcomePage1.dart';
import 'WelcomePage2.dart';
import 'WelcomePage3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_register_screen.dart';

class WelcomeMain extends StatelessWidget {
    WelcomeMain({super.key});

  final _controller=PageController();
  int page=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Container(
        padding:EdgeInsets.all(20),
        height:double.infinity,
        width:double.infinity,
        color:Colors.white,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[
          SizedBox(height:70),
            GestureDetector(
              onTap: ()=> Navigator.of(context).pushReplacementNamed(LoginRegisterScreen.routeName),
              child:
              Align(alignment: Alignment.centerRight,
                child:Container(
                  child:Text("Skip",
                  style:TextStyle(fontSize:16,fontWeight:FontWeight.bold))
              )
              )
            ),
          Container(height:550, width:double.infinity, 
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.white),
          child:

            PageView( 
            controller: _controller,
            children: [
              Welcome1(),
              Welcome2(),
              Welcome3(),

          
        ])
     
        ),
        


          
          
      SizedBox(height:20),
          
      Center(child:SmoothPageIndicator(
            controller: _controller,
            count:3,
            effect:ExpandingDotsEffect()

          )
          ),
          
      Container(
            height:40,
            width:100,
            decoration:BoxDecoration(
              color:primaryDarkPurple,
              borderRadius: BorderRadius.circular(30)
              ),
                child: Center(child:Text(
                     'Next',
                      style: TextStyle(
                      color:Colors.white,
                      fontSize:16,
                      fontWeight:FontWeight.bold),     
                     ))
              
            ),
        ])

         
      )





    );

  }
}