import 'package:carve_app/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../models/colors.dart';

class Welcome3 extends StatelessWidget {
  const Welcome3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      
      Container(
        
        width:double.infinity,
        height:500,
        color:Colors.white,
        child:Column(

          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              width:double.infinity,
              height:330,
              decoration:BoxDecoration(
                image: DecorationImage(
                image: AssetImage('lib/assets/images/pregnant.jpg'),
                fit: BoxFit.fill)
              )
            
            ),
            SizedBox(height:50),

            Text(
              "Parenting Simplified",
              style:TextStyle(color:primaryDarkPurple,fontSize:24,fontWeight:FontWeight.bold)
            ),

           SizedBox(height:30), 
           Center(
                    child:Text(
                        "Learn essential parenting skills in just 10 minutes with our personalized content and resources for busy parents.",
                        style:TextStyle(color:Colors.black,fontSize:16),
                        textAlign: TextAlign.center,
            )
            ),
          // SizedBox(height:20),
          // Container(
          //   height:40,
          //   width:100,
          //   decoration:BoxDecoration(
          //              color:primaryDarkPurple,
          //              borderRadius: BorderRadius.circular(30)
          //              ),
          //   child:Center(
          //          child: Text(
          //          'Next',
          //           style: TextStyle(
          //           color:Colors.white,
          //           fontSize:16,
          //           fontWeight:FontWeight.bold),     
          //                           )
          //         )
          // )
          


                
                 

            

        ])

        
      )
        



    );
  }
}