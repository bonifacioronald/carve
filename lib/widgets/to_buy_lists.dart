import 'package:flutter/material.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  bool toBuy = false;
  bool gotIt = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Row(
        children: [
          Text('hello'),
          Spacer(),
          Container(
              child: Row(
            children: [
              Checkbox(
                  value: toBuy,
                  onChanged: (bool? value) {
                    setState(() {
                      toBuy = value!;
                      gotIt = false;
                    });
                  }),
              Checkbox(
                  value: gotIt,
                  onChanged: (bool? value) {
                    setState(() {
                      gotIt = value!;
                      toBuy = false;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
