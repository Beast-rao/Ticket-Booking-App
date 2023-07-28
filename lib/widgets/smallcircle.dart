import 'package:flutter/material.dart';

class SmallCircle extends StatelessWidget {
  final Color isColor;

  const SmallCircle({super.key, required this.isColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border:
              Border.all(color: isColor, style: BorderStyle.solid, width: 2.5)),
    );
  }
}
