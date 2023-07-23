import 'package:flutter/material.dart';

import '../utils/styles.dart';
class DoubleText extends StatelessWidget {
  final String bn;
  final String sn;

  const DoubleText({super.key, required this.bn, required this.sn});

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
          onTap: () {},
          child: Text(
            sn,
            style: Styles.textStyle
                .copyWith(color: Styles.primaryColor),
          ),
        )
      ],
    );
  }
}
