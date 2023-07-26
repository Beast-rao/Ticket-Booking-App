import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookingapp/Screens/hotels.dart';
import 'package:ticketbookingapp/Screens/hotels_viewall.dart';
import 'package:ticketbookingapp/Screens/ticketview.dart';
import 'package:ticketbookingapp/Screens/upcoming_flights.dart';
import 'package:ticketbookingapp/utils/app_layouts.dart';

import '../utils/app_list_models.dart';
import '../utils/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.bColor,
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Good Morning", style: Styles.headLineStyle3),
                          Gap(5),
                          Text(
                            "Book Tickets",
                            style: Styles.headLineStyle1,
                          )
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("assets/images/img_1.png"))),
                      )
                    ],
                  ),
                  Gap(25),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(10), vertical:AppLayout.getHeight(10)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF4F6FD)
                        // color: Colors.white
                        ),
                    child:TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FluentIcons.search_28_regular,
                          color: Color(0xFFBFC205),
                        ),
                        hintText: "Search",
                        border: InputBorder.none,

                      ),

                    )
                    ,
                    // Row(
                    //   children: [
                    //     Icon(
                    //       FluentIcons.search_28_regular,
                    //       color: Color(0xFFBFC205),
                    //     ),
                    //     Text(
                    //       "Search",
                    //       style: Styles.headLineStyle4,
                    //     )
                    //   ],
                    // ),
                  ),
                  Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming Flights",
                        style: Styles.headLineStyle2,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UpcomingFlights()));
                        },
                        child: Text(
                          "View all",
                          style: Styles.textStyle
                              .copyWith(color: Styles.primaryColor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Gap(15),
            TicketsWidget(dir: Axis.horizontal),
            Gap(15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hotels",
                    style: Styles.headLineStyle2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HotelViewAll()));

                    },
                    child: Text(
                      "View all",
                      style:
                          Styles.textStyle.copyWith(color: Styles.primaryColor),
                    ),
                  )
                ],
              ),
            ),
            Gap(15),
            //hotels view cards are here
            HotelsWidget(),
          ],
        ),
      ),
    );
  }
}

class HotelsWidget extends StatelessWidget {
  bool? isHotelScreen;
   HotelsWidget({
    super.key,
     this.isHotelScreen
  });

  @override
  Widget build(BuildContext context) {
    return isHotelScreen==null? SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: hotelList.map((e) => Hotel(hotel: e)).toList(),
      ),
    ): GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
    children: hotelList.map((e) => Hotel(hotel: e,isHotelView: true),).toList(),scrollDirection: Axis.vertical ,);
  }
}

class TicketsWidget extends StatelessWidget {
  final Axis dir;
  final bool? isCheck;

  const TicketsWidget({super.key, required this.dir,this.isCheck});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: dir,
      padding:isCheck==null? EdgeInsets.only(left:AppLayout.getHeight(20),):EdgeInsets.symmetric(horizontal : AppLayout.getHeight(20)),
      child: isCheck==null? Row(
        children:ticketList.map((e) => TicketView(ticket: e,color: Colors.white,)).toList()
      ):Column(
          children:ticketList.map((e) => TicketView(ticket: e,color: Colors.white,istickets: true,)).toList()

      ),
    );
  }
}
