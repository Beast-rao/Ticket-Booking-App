import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ticketbookingapp/Screens/hotels.dart';
import 'package:ticketbookingapp/Screens/hotels_viewall.dart';
import 'package:ticketbookingapp/Screens/ticketview.dart';
import 'package:ticketbookingapp/Screens/upcoming_flights.dart';
import 'package:ticketbookingapp/utils/app_layouts.dart';

import '../utils/app_list_models.dart';
import '../utils/styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _search = [];
  List<Map<String, dynamic>> _searchotel = [];
  List<Map<String, dynamic>> _hotelLiist = [];
  List<Map<String, dynamic>> _ticketList =
      []; // New variable to store original data

  @override
  void initState() {
    _ticketList = ticketList; // Initialize _ticketList with the original data
    _search = _ticketList; // Initialize _search with the original data
    _hotelLiist = hotelList; // Initialize _hotelList with the original data
    _searchotel = _hotelLiist; // Initialize _searchotel with the original data
    super.initState();
  }

  void _runSearch(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    List<Map<String, dynamic>> hresults = [];

    if (enterKeyword.isEmpty) {
      results = _ticketList;
      hresults = _hotelLiist;
    } else {
      results = _ticketList
          .where((ticket) =>
              ticket['from']['name']
                  .toLowerCase()
                  .contains(enterKeyword.toLowerCase()) ||
              ticket['from']['code']
                  .toLowerCase()
                  .contains(enterKeyword.toLowerCase()) ||
              ticket['to']['code']
                  .toLowerCase()
                  .contains(enterKeyword.toLowerCase()) ||
              ticket['from']['name']
                  .toLowerCase()
                  .contains(enterKeyword.toLowerCase()) ||
              ticket['number'].toString().contains(enterKeyword.toString()))
          .toList();
      hresults = _hotelLiist
          .where((hotel) =>
              hotel['place']
                  .toLowerCase()
                  .contains(enterKeyword.toLowerCase()) ||
              hotel['destination']
                  .toLowerCase()
                  .contains(enterKeyword.toLowerCase()) ||
              hotel['price'].toString().contains(enterKeyword.toString()))
          .toList();
    }

    setState(() {
      _search = results;
      _searchotel = hresults;
    });
  }

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
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getHeight(10),
                        vertical: AppLayout.getHeight(10)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF4F6FD)
                        // color: Colors.white
                        ),
                    child: TextFormField(
                      onChanged: _runSearch,
                      // Call _runSearch when text changes
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FluentIcons.search_28_regular,
                          color: Color(0xFFBFC205),
                        ),
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
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
                          Get.to(UpcomingFlights());
                        },
                        splashColor: Colors.transparent,
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
            TicketsWidget(dir: Axis.horizontal, ticket: _search),
            // Pass _search list to TicketsWidget
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
                      Get.to(HotelViewAll());
                    },
                    splashColor: Colors.transparent,
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
            HotelsWidget(hotel: _searchotel),
          ],
        ),
      ),
    );
  }
}

class HotelsWidget extends StatelessWidget {
  bool? isHotelScreen;
  final List<Map<String, dynamic>>
      hotel; // Add a new parameter for the filtered list
  HotelsWidget({super.key, this.isHotelScreen, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return isHotelScreen == null
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: hotel.map((e) => Hotel(hotel: e)).toList(),
            ),
          )
        : GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            children: hotel
                .map(
                  (e) => Hotel(hotel: e, isHotelView: true),
                )
                .toList(),
            scrollDirection: Axis.vertical,
          );
  }
}

class TicketsWidget extends StatelessWidget {
  final Axis dir;
  final List<Map<String, dynamic>>
      ticket; // Add a new parameter for the filtered list
  final bool? isCheck;

  TicketsWidget(
      {Key? key, required this.dir, required this.ticket, this.isCheck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: dir,
      padding: isCheck == null
          ? EdgeInsets.only(
              left: AppLayout.getHeight(20),
            )
          : EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20)),
      child: isCheck == null
          ? Row(
              children: ticket
                  .map((e) => TicketView(
                        ticket: e,
                        color: Colors.white,
                      ))
                  .toList())
          : Column(
              children: ticket
                  .map((e) => TicketView(
                        ticket: e,
                        color: Colors.white,
                        istickets: true,
                      ))
                  .toList()),
    );
  }
}
