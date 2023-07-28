import 'package:flutter/material.dart';
import '../utils/styles.dart';

class DoubleText extends StatelessWidget {
  final String bn;
  final String sn;
  final Function press; // Use Function type for the callback

  const DoubleText(
      {super.key, required this.bn, required this.sn, required this.press});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bn,
          style: Styles.headLineStyle2,
        ),
        InkWell(
          onTap: () {
            press(); // Call the press function using parentheses
          },
          splashColor: Colors.transparent,
          child: Text(
            sn,
            style: Styles.textStyle.copyWith(color: Styles.primaryColor),
          ),
        )
      ],
    );
  }
}
