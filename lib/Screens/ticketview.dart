import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookingapp/utils/app_layouts.dart';
import 'package:ticketbookingapp/utils/styles.dart';
import 'package:ticketbookingapp/widgets/smallcircle.dart';
import '../widgets/layout.dart';
import '../widgets/reusecolumn.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  bool? istickets;
  final Color color;

  TicketView(
      {super.key,
      required this.ticket,
      this.isColor,
      required this.color,
      this.istickets});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return Column(
      children: [
        Container(
          width: size.width * 0.85,
          height: istickets == null
              ? AppLayout.getHeight(184)
              : AppLayout.getHeight(222),
          child: istickets == null
              ? Container(
                  margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
                  child: Column(
                    children: [
                      // It is the blue part of the ticket
                      Container(
                        padding: EdgeInsets.all(AppLayout.getHeight(16)),
                        decoration: BoxDecoration(
                            color: isColor == null
                                ? Color(0xFF526799)
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  ticket['from']['code'],
                                  style: isColor == null
                                      ? Styles.headLineStyle3
                                          .copyWith(color: Colors.white)
                                      : Styles.headLineStyle3,
                                ),
                                Spacer(), // to give the equal space between widgets
                                SmallCircle(isColor: color),
                                Expanded(
                                  child: Stack(
                                    //we are using it to overlap aeroplane icon over it
                                    children: [
                                      SizedBox(
                                        height: AppLayout.getHeight(24),
                                        child: LayoutBuilder(
                                          builder: (BuildContext context,
                                              BoxConstraints constraints) {
                                            return Flex(
                                              direction: Axis.horizontal,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                // to generate the dot items
                                                (constraints.constrainWidth() /
                                                        6)
                                                    .floor(),
                                                (index) => SizedBox(
                                                  width: AppLayout.getWidth(3),
                                                  height:
                                                      AppLayout.getHeight(1),
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color: isColor == null
                                                            ? Colors.white
                                                            : Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Center(
                                        child: Transform.rotate(
                                          // to rotate the icons
                                          angle: 1.5,
                                          child: Icon(
                                            Icons.airplanemode_on_rounded,
                                            color: isColor == null
                                                ? Colors.white
                                                : Color(0xFF8ACCF7),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SmallCircle(
                                  isColor: color,
                                ),
                                Spacer(),
                                Text(
                                  ticket['to']['code'],
                                  style: isColor == null
                                      ? Styles.headLineStyle3
                                          .copyWith(color: Colors.white)
                                      : Styles.headLineStyle3,
                                )
                              ],
                            ),
                            Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ticket['from']['name'],
                                  style: isColor == null
                                      ? Styles.headLineStyle4
                                          .copyWith(color: Colors.white)
                                      : Styles.headLineStyle4,
                                ),
                                Text(
                                  ticket['flying_time'],
                                  style: Styles.headLineStyle4
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  ticket['to']['name'],
                                  style: isColor == null
                                      ? Styles.headLineStyle4
                                          .copyWith(color: Colors.white)
                                      : Styles.headLineStyle4,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // Now we will show the orange part of the ticket there
                      Container(
                        color: isColor == null
                            ? Styles.orangecardColor
                            : Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              height: AppLayout.getHeight(20),
                              width: AppLayout.getWidth(10),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                  height: AppLayout.getHeight(24),
                                  child: LayoutBuilders(
                                    section: 10,
                                    isColor: false,
                                    width: 5,
                                  )),
                            ),
                            SizedBox(
                              height: AppLayout.getHeight(20),
                              width: AppLayout.getWidth(10),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                              ),
                            )
                          ],
                        ),
                      ),
                      // bottom part of the card
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: isColor == null
                                ? Styles.orangecardColor
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: isColor == null
                                  ? Radius.circular(20)
                                  : Radius.circular(0),
                              bottomRight: isColor == null
                                  ? Radius.circular(20)
                                  : Radius.circular(0),
                            )),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReuseColumn(
                                    name: ticket['date'],
                                    who: "Date",
                                    alignment: CrossAxisAlignment.start,
                                    isColor: isColor),
                                ReuseColumn(
                                    name: ticket['departure_time'],
                                    who: "Departure Time",
                                    alignment: CrossAxisAlignment.end,
                                    isColor: isColor),
                                ReuseColumn(
                                    name: ticket["number"].toString(),
                                    who: "Number",
                                    alignment: CrossAxisAlignment.end,
                                    isColor: isColor),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: Container(
                    margin: EdgeInsets.all(AppLayout.getHeight(10)),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // It is the blue part of the ticket
                        Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(16)),
                          decoration: BoxDecoration(
                              color: isColor == null
                                  ? Color(0xFF526799)
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    ticket['from']['code'],
                                    style: isColor == null
                                        ? Styles.headLineStyle3
                                            .copyWith(color: Colors.white)
                                        : Styles.headLineStyle3,
                                  ),
                                  Spacer(), // to give the equal space between widgets
                                  SmallCircle(isColor: color),
                                  Expanded(
                                    child: Stack(
                                      //we are using it to overlap aeroplane icon over it
                                      children: [
                                        SizedBox(
                                          height: AppLayout.getHeight(24),
                                          child: LayoutBuilder(
                                            builder: (BuildContext context,
                                                BoxConstraints constraints) {
                                              return Flex(
                                                direction: Axis.horizontal,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                  // to generate the dot items
                                                  (constraints.constrainWidth() /
                                                          6)
                                                      .floor(),
                                                  (index) => SizedBox(
                                                    width:
                                                        AppLayout.getWidth(3),
                                                    height:
                                                        AppLayout.getHeight(1),
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                          color: isColor == null
                                                              ? Colors.white
                                                              : Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Center(
                                          child: Transform.rotate(
                                            // to rotate the icons
                                            angle: 1.5,
                                            child: Icon(
                                              Icons.airplanemode_on_rounded,
                                              color: isColor == null
                                                  ? Colors.white
                                                  : Color(0xFF8ACCF7),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SmallCircle(
                                    isColor: color,
                                  ),
                                  Spacer(),
                                  Text(
                                    ticket['to']['code'],
                                    style: isColor == null
                                        ? Styles.headLineStyle3
                                            .copyWith(color: Colors.white)
                                        : Styles.headLineStyle3,
                                  )
                                ],
                              ),
                              Gap(5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ticket['from']['name'],
                                    style: isColor == null
                                        ? Styles.headLineStyle4
                                            .copyWith(color: Colors.white)
                                        : Styles.headLineStyle4,
                                  ),
                                  Text(
                                    ticket['flying_time'],
                                    style: Styles.headLineStyle4
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    ticket['to']['name'],
                                    style: isColor == null
                                        ? Styles.headLineStyle4
                                            .copyWith(color: Colors.white)
                                        : Styles.headLineStyle4,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // Now we will show the orange part of the ticket there
                        Container(
                          color: isColor == null
                              ? Styles.orangecardColor
                              : Colors.white,
                          child: Row(
                            children: [
                              SizedBox(
                                height: AppLayout.getHeight(20),
                                width: AppLayout.getWidth(10),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    height: AppLayout.getHeight(24),
                                    child: LayoutBuilders(
                                      section: 10,
                                      isColor: false,
                                      width: 5,
                                    )),
                              ),
                              SizedBox(
                                height: AppLayout.getHeight(20),
                                width: AppLayout.getWidth(10),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                ),
                              )
                            ],
                          ),
                        ),
                        // bottom part of the card
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: isColor == null
                                  ? Styles.orangecardColor
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: isColor == null
                                    ? Radius.circular(20)
                                    : Radius.circular(0),
                                bottomRight: isColor == null
                                    ? Radius.circular(20)
                                    : Radius.circular(0),
                              )),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ReuseColumn(
                                      name: ticket['date'],
                                      who: "Date",
                                      alignment: CrossAxisAlignment.start,
                                      isColor: isColor),
                                  ReuseColumn(
                                      name: ticket['departure_time'],
                                      who: "Departure Time",
                                      alignment: CrossAxisAlignment.end,
                                      isColor: isColor),
                                  ReuseColumn(
                                      name: ticket["number"].toString(),
                                      who: "Number",
                                      alignment: CrossAxisAlignment.end,
                                      isColor: isColor),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        )
      ],
    );
  }
}
