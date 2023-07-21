import 'package:flutter/material.dart';
class SmallCircle extends StatelessWidget {
  const SmallCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white,style: BorderStyle.solid,width: 2.5  )
      ),
    );
  }
}
