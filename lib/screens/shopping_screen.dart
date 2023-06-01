import 'package:flutter/material.dart';
import '../widgets/shopping_widget.dart';
import '../models/colors.dart';

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
              const Shopping('Baby Shampoo'),
              const Shopping('Baby Clothes'),
              const Shopping('Baby Monitor'),
              const Shopping('Baby Toys'),
              const Shopping('Baby Chair'),
              const Shopping('Baby Cot'),
              const Shopping('Baby Lotion'),
              const Shopping('Baby Diapers'),
              const Shopping('Baby Milk'),
              const Shopping('Parental Vitamins'),
              const Shopping('Baby Car Seat'),
              const Shopping('Supportive Bra'),
            ],
          ),
        ),
      ),
    );
  }
}
