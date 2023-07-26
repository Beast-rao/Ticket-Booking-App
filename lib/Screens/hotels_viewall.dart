import 'package:flutter/material.dart';
import 'package:ticketbookingapp/Screens/home.dart';

import '../utils/app_layouts.dart';
import '../utils/styles.dart';
class HotelViewAll extends StatelessWidget {
  const HotelViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.bColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          title: Text(
            "Hotels",
            style: Styles.headLineStyle2,
          ),
        ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal:AppLayout.getHeight(3) ),
            child: HotelsWidget(
              isHotelScreen: true,
        ),
          ),

      ),
    );
  }
}
