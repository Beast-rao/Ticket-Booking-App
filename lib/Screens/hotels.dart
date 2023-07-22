import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookingapp/utils/app_layouts.dart';

import '../utils/styles.dart';

class Hotel extends StatelessWidget {
  //we are accessing hotel map just like a json file pair of key and value
  final Map<String, dynamic> hotel;

  const Hotel({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: EdgeInsets.only(top: 5, right: 17),
      width: size.width * 0.6,
      height: 350,
      decoration: BoxDecoration(
        color: Styles.bluecardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/${hotel['image']}",
                    ),
                    fit: BoxFit.fill)),
          ),
          Gap(10),
          Text(
            hotel['place'],
            style: Styles.headLineStyle2
                .copyWith(color: CupertinoColors.systemGrey3),
          ),
          Gap(10),
          Text(
            hotel['destination'],
            style: Styles.headLineStyle3.copyWith(color: Colors.white),
          ),
          Gap(10),
          Text(
            "\$${hotel['price']}/night",
            style: Styles.headLineStyle1
                .copyWith(color: CupertinoColors.systemGrey3),
          ),
        ],
      ),
    );
  }
}
