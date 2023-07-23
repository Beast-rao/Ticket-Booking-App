import 'package:flutter/material.dart';

class SmallCircle extends StatelessWidget {
  final bool? isColor;

  const SmallCircle({super.key, this.isColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              color: isColor == null ? Colors.white : Color(0xFF8ACCF7),
              style: BorderStyle.solid,
              width: 2.5)),
    );
  }
}
