import 'package:flutter/material.dart';

import '../utils/app_layouts.dart';
import '../utils/styles.dart';

class Buttons extends StatelessWidget {
  final String first;
  final String second;

  const Buttons({super.key, required this.first, required this.second});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return FittedBox(
        child: Container(
      padding: EdgeInsets.all(3.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.width * 0.44,
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(50))),
            child: Center(
                child: Text(
              first,
              style: Styles.textStyle,
            )),
          ),
          Container(
            width: size.width * 0.44,
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(50))),
            child: Center(
                child: Text(
              second,
              style: Styles.textStyle,
            )),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF4F6FD),
        borderRadius: BorderRadius.circular(50),
      ),
    ));
  }
}
