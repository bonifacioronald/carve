import 'package:carve_app/models/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/shopping_widget.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});
  static const routeName = '/shopping-screen';

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPurple,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
              top: MediaQuery.of(context).padding.top + 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Shopping('Baby Shampoo'),
              Shopping('Baby Clothes'),
              Shopping('Baby Monitor'),
              Shopping('Baby Toys'),
              Shopping('Baby Chair'),
              Shopping('Baby Cot'),
              Shopping('Baby Lotion'),
              Shopping('Baby Diapers'),
              Shopping('Baby Milk'),
            ],
          ),
        ),
      ),
    );
  }
}
