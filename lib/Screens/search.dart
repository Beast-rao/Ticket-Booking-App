import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ticketbookingapp/Screens/upcoming_flights.dart';
import 'package:ticketbookingapp/utils/styles.dart';
import 'package:ticketbookingapp/widgets/amazed.dart';
import 'package:ticketbookingapp/widgets/double_text.dart';
import 'package:ticketbookingapp/widgets/flight%20.dart';
import '../utils/app_layouts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.bColor,
        body: ListView(
          padding: EdgeInsets.symmetric(
              vertical: AppLayout.getWidth(20),
              horizontal: AppLayout.getWidth(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text(
              "What are\n you looking for?",
              style: Styles.headLineStyle1.copyWith(
                  fontSize: AppLayout.getHeight(35),
                  fontWeight: FontWeight.bold),
            ),
            Gap(AppLayout.getHeight(20)),
            Buttons(first: "Airlines Tickets", second: "Hotels"),
            Gap(AppLayout.getHeight(25)),
            Flight(icon: Icons.flight_takeoff_rounded, name: "Departure"),
            Gap(AppLayout.getHeight(20)),
            Flight(icon: Icons.flight_land_rounded, name: "Arrival"),
            Gap(AppLayout.getHeight(25)),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(15),
                  vertical: AppLayout.getWidth(15)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                  color: Color(0xD91130CE)),
              child: Center(
                  child: Text(
                "Find Tickets",
                style: Styles.textStyle.copyWith(color: Colors.white),
              )),
            ),
            Gap(AppLayout.getHeight(40)),
            DoubleText(
                bn: "Upcoming Flights",
                sn: "View all",
                press: () {
                  Get.to(UpcomingFlights());
                }),
            Gap(AppLayout.getHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.42,
                  height: AppLayout.getHeight(470),
                  padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(15),
                      horizontal: AppLayout.getHeight(15)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: CupertinoColors.systemGrey2,
                          blurRadius: 1,
                          spreadRadius: 1,
                        )
                      ],
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(20))),
                  child: Column(
                    children: [
                      Container(
                        height: AppLayout.getHeight(190),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppLayout.getWidth(12)),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/sit.jpg"),
                          ),
                        ),
                      ),
                      Gap(AppLayout.getHeight(12)),
                      Text(
                          "50% discount on the early booking of our flight. Don't miss!",
                          style: Styles.headLineStyle2),
                      Gap(AppLayout.getHeight(5)),
                      Text(
                        "By RAO",
                        style: Styles.headLineStyle2.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: AppLayout.getHeight(20),
                            color: Colors.green),
                      )
                    ],
                  ),
                ),
                // Gap(AppLayout.getWidth(20)),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: size.width * 0.44,
                          height: AppLayout.getHeight(210),
                          decoration: BoxDecoration(
                            color: Color(0xFF3AB8B8),
                            borderRadius: BorderRadius.circular(
                              AppLayout.getHeight(18),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: CupertinoColors.systemGrey2,
                                blurRadius: 1,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: AppLayout.getHeight(15),
                              horizontal: AppLayout.getHeight(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Discount\nfor survey",
                                style: Styles.headLineStyle2.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap(AppLayout.getHeight(10)),
                              Text(
                                  "Take a survey about our services and get discount",
                                  style: Styles.headLineStyle2.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppLayout.getHeight(18))),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -40,
                          right: -45,
                          child: Container(
                            padding: EdgeInsets.all(AppLayout.getHeight(30)),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color(0xFF189999), width: 18),
                                color: Colors.transparent),
                          ),
                        )
                      ],
                    ),
                    Gap(AppLayout.getHeight(15)),
                    Stack(
                      children: [
                        Container(
                            width: size.width * 0.44,
                            height: AppLayout.getHeight(250),
                            padding: EdgeInsets.symmetric(
                                vertical: AppLayout.getHeight(15),
                                horizontal: AppLayout.getHeight(15)),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: CupertinoColors.systemGrey2,
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                  )
                                ],
                                color: Color(0xFFEC6845),
                                borderRadius: BorderRadius.circular(
                                    AppLayout.getHeight(18))),
                            child: Column(
                              children: [
                                Text(
                                  "Stay Happy",
                                  style: Styles.headLineStyle2.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Gap(AppLayout.getHeight(5)),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: '😇',
                                      style: TextStyle(
                                          fontSize: AppLayout.getHeight(38))),
                                  TextSpan(
                                      text: '😈',
                                      style: TextStyle(
                                          fontSize: AppLayout.getHeight(55))),
                                  TextSpan(
                                      text: '🥰',
                                      style: TextStyle(
                                          fontSize: AppLayout.getHeight(38))),
                                ])),
                                Gap(AppLayout.getHeight(15)),
                                Text(
                                  "Faheem Rao",
                                  style: Styles.headLineStyle2.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        Positioned(
                          bottom: -43,
                          left: -48,
                          child: Container(
                            padding: EdgeInsets.all(AppLayout.getHeight(30)),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color(0xFFBF360C), width: 18),
                                color: Colors.transparent),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
