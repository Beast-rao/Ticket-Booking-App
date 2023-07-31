import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookingapp/Screens/ticketview.dart';
import 'package:ticketbookingapp/utils/app_layouts.dart';
import 'package:ticketbookingapp/utils/app_list_models.dart';
import 'package:ticketbookingapp/utils/styles.dart';
import 'package:ticketbookingapp/widgets/amazed.dart';
import 'package:ticketbookingapp/widgets/reusecolumn.dart';
import '../widgets/layout.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Styles.bColor,
          body: Stack(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getHeight(20),
                    vertical: AppLayout.getHeight(20)),
                children: [
                  Gap(AppLayout.getHeight(40)),
                  Text(
                    "Tickets",
                    style: Styles.headLineStyle1,
                  ),
                  Gap(AppLayout.getHeight(20)),
                  Buttons(first: "Upcoming", second: "Previous"),
                  Gap(AppLayout.getHeight(20)),
                  Container(
                    padding: EdgeInsets.only(left: AppLayout.getHeight(16)),
                    child: TicketView(
                      ticket: ticketList[0],
                      isColor: true,
                      color: Color(0xFF8ACCF7),
                    ),
                  ),
                  // SizedBox(
                  //   height: 1,
                  // ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getHeight(16),
                        vertical: AppLayout.getHeight(20)),
                    margin: EdgeInsets.symmetric(
                        horizontal: AppLayout.getHeight(15)),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReuseColumn(
                                name: "Rao Faheem",
                                who: "Passenger",
                                alignment: CrossAxisAlignment.start,
                                isColor: false),
                            ReuseColumn(
                                name: "4287 326287",
                                who: "Passport",
                                alignment: CrossAxisAlignment.end,
                                isColor: false),
                          ],
                        ),
                        Gap(AppLayout.getHeight(20)),
                        LayoutBuilders(section: 10, isColor: false, width: 5),
                        Gap(AppLayout.getHeight(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReuseColumn(
                                name: "8754 987 89743",
                                who: "Number of e-ticket",
                                alignment: CrossAxisAlignment.start,
                                isColor: false),
                            ReuseColumn(
                              name: "F4R4A0O",
                              who: "Booking Code",
                              alignment: CrossAxisAlignment.end,
                              isColor: false,
                            ),
                          ],
                        ),
                        Gap(AppLayout.getHeight(20)),
                        LayoutBuilders(section: 10, isColor: false, width: 5),
                        Gap(AppLayout.getHeight(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/visa.png",
                                      scale: 11,
                                    ),
                                    Text(
                                      "*** 4485",
                                      style: Styles.headLineStyle3,
                                    )
                                  ],
                                ),
                                Gap(AppLayout.getHeight(5)),
                                Text(
                                  "Payment Method ",
                                  style: Styles.headLineStyle4,
                                )
                              ],
                            ),
                            ReuseColumn(
                              name: "\$199.00",
                              who: "Price",
                              alignment: CrossAxisAlignment.end,
                              isColor: false,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: AppLayout.getHeight(15),
                        right: AppLayout.getHeight(15)),
                    padding: EdgeInsets.only(
                        top: AppLayout.getHeight(20),
                        bottom: AppLayout.getHeight(20)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft:
                                Radius.circular(AppLayout.getHeight(21)),
                            bottomRight: Radius.circular(
                              AppLayout.getHeight(21),
                            ))),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(15)),
                        child: BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: "https://github.com/martinovovo ",
                          drawText: false,
                          color: Styles.textColor,
                          width: double.infinity,
                          height: 70,
                        ),
                      ),
                    ),
                  ),
                  Gap(AppLayout.getHeight(20)),
                  Container(
                    padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                    child: TicketView(
                      ticket: ticketList[0],
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 300,
                left: 25,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      )),
                  child: CircleAvatar(
                    maxRadius: AppLayout.getHeight(4),
                    backgroundColor: Styles.textColor,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                right: 25,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      )),
                  child: CircleAvatar(
                    maxRadius: AppLayout.getHeight(4),
                    backgroundColor: Styles.textColor,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
