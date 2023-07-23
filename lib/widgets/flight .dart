import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/styles.dart';
class Flight extends StatelessWidget {
  final IconData icon;
  final String name;

  const Flight({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return           Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      child: Row(
        children: [
          Icon(icon,color: Colors.grey), Gap(10),
          Text(name,style: Styles.textStyle,)
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,

      ),
    )
    ;
  }
}
