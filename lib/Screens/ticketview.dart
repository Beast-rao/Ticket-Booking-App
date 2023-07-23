import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookingapp/utils/app_layouts.dart';
import 'package:ticketbookingapp/utils/styles.dart';
import 'package:ticketbookingapp/widgets/smallcircle.dart';

class TicketView extends StatelessWidget {
  final Map<String,dynamic> ticket;
  const TicketView({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return SizedBox(
      width: size.width*0.85,
      height: AppLayout.getHeight(200),
      child: Container(
        margin: EdgeInsets.only( right: AppLayout.getHeight(16)),
        child: Column(
          children: [
            // It is the blue part of the ticket
            Container(
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              decoration: BoxDecoration(
                  color: Color(0xFF526799),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                      Spacer(), // to give the equal space between widgets
                      SmallCircle(),
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
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                      // to generate the dot items
                                      (constraints.constrainWidth() / 6)
                                          .floor(),
                                      (index) => SizedBox(
                                        width: AppLayout.getWidth(3),
                                        height: AppLayout.getHeight(1),
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Colors.white),
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
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SmallCircle(),
                      Spacer(),
                      Text(
                        ticket['to']['code'],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ticket['from']['name'],
                        style:
                            Styles.headLineStyle4.copyWith(color: Colors.white),
                      ),
                      Text(
                        ticket['flying_time'],
                        style:
                            Styles.headLineStyle4.copyWith(color: Colors.white),
                      ),
                      Text(
                        ticket['to']['name'],
                        style:
                            Styles.headLineStyle4.copyWith(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Now we will show the orange part of the ticket there
            Container(
              color: Styles.orangecardColor,
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
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                              // to generate the dot items
                              (constraints.constrainWidth() / 10).floor(),
                              (index) => SizedBox(
                                width: AppLayout.getWidth(3),
                                height: AppLayout.getHeight(1),
                                child: DecoratedBox(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
                  color: Styles.orangecardColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket['date'],style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          Gap(5),
                          Text("Date",style: Styles.headLineStyle4.copyWith(color: Colors.white),)
                        ],
                      ),
                      Column(
                        children: [
                          Text(ticket['departure_time'],style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          Gap(5),
                          Text("Departure Time",style: Styles.headLineStyle4.copyWith(color: Colors.white),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(ticket["number"].toString(),style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          Gap(5),
                          Text("Number",style: Styles.headLineStyle4.copyWith(color: Colors.white),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
