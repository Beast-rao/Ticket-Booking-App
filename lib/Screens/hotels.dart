import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookingapp/utils/app_layouts.dart';

import '../utils/styles.dart';

class Hotel extends StatelessWidget {
  //we are accessing hotel map just like a json file pair of key and value
  final Map<String, dynamic> hotel;
  bool? isHotelView;

   Hotel({super.key, required this.hotel,this.isHotelView});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return Container(
      padding: isHotelView==null?EdgeInsets.symmetric(horizontal: 15, vertical: 17):EdgeInsets.symmetric(horizontal: 10, vertical:9),
      margin:isHotelView==null? EdgeInsets.only(top: 5, right: 17):EdgeInsets.only(top: 5, right: 5),
      width: size.width * 0.6,
      height:isHotelView==null? 350:370,
      decoration: BoxDecoration(
        color: Styles.bluecardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: isHotelView==null?AppLayout.getHeight(180):AppLayout.getHeight(86),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/${hotel['image']}",
                    ),
                    scale: 2,
                    fit: BoxFit.fill)),
          ),
          isHotelView==null?Gap(AppLayout.getHeight(10)):Gap(AppLayout.getHeight(1)),
          Text(
            hotel['place'],
            style:isHotelView==null? Styles.headLineStyle2
                .copyWith(color: CupertinoColors.systemGrey3):Styles.headLineStyle3.copyWith(color: CupertinoColors.systemGrey3),
          ),
          isHotelView==null?Gap(AppLayout.getHeight(10)):Gap(AppLayout.getHeight(1)),
          Text(
            hotel['destination'],
            style:isHotelView==null? Styles.headLineStyle3.copyWith(color: Colors.white):Styles.textStyle.copyWith(color: Colors.white),
          ),
          isHotelView==null?Gap(AppLayout.getHeight(10)):Gap(AppLayout.getHeight(1)),
          Text(
            "\$${hotel['price']}/night",
            style:isHotelView==null? Styles.headLineStyle1
                .copyWith(color: CupertinoColors.systemGrey3):Styles.headLineStyle3.copyWith(color: CupertinoColors.systemGrey3),
          ),
        ],
      ),
    );
  }
}
