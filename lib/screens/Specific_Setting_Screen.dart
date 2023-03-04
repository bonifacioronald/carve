import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../widgets/Specific_SettingWidget.dart';


class SpecSettingScreen extends StatelessWidget {
  const SpecSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            
            child:
            SpecSetting('Notification','Push Notification')

          )
          
          );

      
    
  }
}