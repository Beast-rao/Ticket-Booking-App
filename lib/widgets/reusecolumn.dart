import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layouts.dart';
import '../utils/styles.dart';

class ReuseColumn extends StatelessWidget {
  final String name;
  final String who;
  final CrossAxisAlignment alignment;
  final bool? isColor;

  const ReuseColumn(
      {super.key,
      required this.name,
      required this.who,
      required this.alignment,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          name,
          style: isColor == null
              ? Styles.headLineStyle3.copyWith(color: Colors.white)
              : Styles.headLineStyle3,
        ),
        Gap(AppLayout.getHeight(5)),
        Text(
          who,
          style: isColor == null
              ? Styles.headLineStyle4.copyWith(color: Colors.white)
              : Styles.headLineStyle4,
        )
      ],
    );
  }
}
