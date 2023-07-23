import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookingapp/utils/styles.dart';
import 'package:ticketbookingapp/widgets/reusecolumn.dart';

import '../utils/app_layouts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Styles.bColor,
          body: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(15),
              vertical: AppLayout.getHeight(15),
            ),
            children: [
              Gap(
                AppLayout.getHeight(40),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: AppLayout.getHeight(86),
                    width: AppLayout.getHeight(86),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/images/img_1.png"))),
                  ),
                  Gap(
                    AppLayout.getHeight(8),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Book Tickets", style: Styles.headLineStyle1),
                      Gap(
                        AppLayout.getHeight(5),
                      ),
                      Text(
                        "Pakistan",
                        style: Styles.textStyle.copyWith(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Gap(
                        AppLayout.getHeight(5),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: AppLayout.getHeight(3)),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppLayout.getHeight(100)),
                            color: Color(0xFFFEF4F3)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(AppLayout.getHeight(4)),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF526799),
                              ),
                              child: Icon(
                                FluentIcons.shield_12_filled,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                            Gap(
                              AppLayout.getHeight(5),
                            ),
                            Text(
                              "Premium status",
                              style: Styles.headLineStyle4.copyWith(
                                  color: Color(0xFF526799),
                                  fontWeight: FontWeight.bold),
                            ),
                            Gap(
                              AppLayout.getHeight(5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Text(
                            "Edit",
                            style: Styles.textStyle
                                .copyWith(color: Styles.primaryColor),
                          )),
                    ],
                  )
                ],
              ),
              Gap(
                AppLayout.getHeight(30),
              ),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(40),
                      // horizontal: AppLayout.getHeight(40),
                    ),
                    decoration: BoxDecoration(
                        color: Styles.primaryColor,
                        borderRadius: (BorderRadius.circular(15))),
                  ),
                  Positioned(
                    right: -20,
                    top: -20,
                    child: Container(
                      padding: EdgeInsets.all(AppLayout.getHeight(20)),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Color(0xFF264CD2),
                            width: AppLayout.getHeight(14)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:AppLayout.getHeight(20),
                        vertical: AppLayout.getHeight(15)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 24,
                          child: Icon(
                            FluentIcons.lightbulb_filament_16_filled,
                            color: Styles.primaryColor,
                          ),
                        ),
                        Gap(AppLayout.getWidth(7)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "You\'e got a new Award",
                              style: Styles.headLineStyle1
                                  .copyWith(color: Colors.white),
                            ),
                            Gap(
                              AppLayout.getHeight(3),
                            ),
                            Text(
                              "You have 100 flights in a year!",
                              style: Styles.headLineStyle3
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Gap(
                AppLayout.getHeight(25),
              ),
              Text(
                "Accumulated Miles",
                style: Styles.headLineStyle1,
              ),
              Gap(
                AppLayout.getHeight(40),
              ),
              Center(
                  child: Text(
                "448134",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black),
              )),
              Gap(
                AppLayout.getHeight(20),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Miles accrued",
                          style: Styles.headLineStyle4,
                        ),
                        Text(
                          "22 July 2023",
                          style: Styles.headLineStyle4,
                        )
                      ],
                    ),
                    Gap(
                      AppLayout.getHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReuseColumn(
                          name: "34 986",
                          who: "Miles",
                          alignment: CrossAxisAlignment.start,
                          isColor: false,
                        ),
                        ReuseColumn(
                          name: "Airline DE",
                          who: "Recevied from",
                          alignment: CrossAxisAlignment.end,
                          isColor: false,
                        ),
                      ],
                    ),
                    Gap(
                      AppLayout.getHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReuseColumn(
                          name: "24",
                          who: "Miles",
                          alignment: CrossAxisAlignment.start,
                          isColor: false,
                        ),
                        ReuseColumn(
                          name: "Turkish",
                          who: "Recevied from",
                          alignment: CrossAxisAlignment.end,
                          isColor: false,
                        ),
                      ],
                    ),
                    Gap(
                      AppLayout.getHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReuseColumn(
                          name: "65 837",
                          who: "Miles",
                          alignment: CrossAxisAlignment.start,
                          isColor: false,
                        ),
                        ReuseColumn(
                          name: "Munich",
                          who: "Recevied from",
                          alignment: CrossAxisAlignment.end,
                          isColor: false,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Gap(AppLayout.getHeight(20),),
              InkWell(onTap: (){},child: Center(child: Text("How to get more miles",style: Styles.textStyle.copyWith(color: Styles.primaryColor),)))
            ],
          )),
    );
  }
}
