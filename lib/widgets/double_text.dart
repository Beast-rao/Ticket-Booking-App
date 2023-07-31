import 'package:flutter/material.dart';
import '../utils/styles.dart';

class DoubleText extends StatelessWidget {
  final String bn;
  final String sn;
  final void Function() press; // Change the type to a function without arguments

  const DoubleText({Key? key, required this.bn, required this.sn, required this.press})
      : super(key: key);

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
          onTap: press, // Call the function directly without parentheses
          child: Text(
            sn,
            style: Styles.textStyle.copyWith(color: Styles.primaryColor),
          ),
        )
      ],
    );
  }
}
