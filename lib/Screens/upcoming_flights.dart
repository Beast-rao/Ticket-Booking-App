import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketbookingapp/Screens/home.dart';
import 'package:ticketbookingapp/utils/app_layouts.dart';
import 'package:ticketbookingapp/utils/app_list_models.dart';

import '../utils/styles.dart';

class UpcomingFlights extends StatefulWidget {
  @override
  State<UpcomingFlights> createState() => _UpcomingFlightsState();
}

class _UpcomingFlightsState extends State<UpcomingFlights> {
  List<Map<String, dynamic>> _search = [];

  List<Map<String, dynamic>> _ticketList =
  []; // New variable to store original data

  @override
  void initState() {
    _ticketList = ticketList; // Initialize _ticketList with the original data
    _search = _ticketList; // Initialize _search with the original data
    super.initState();
  }

  void _runSearch(String enterKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enterKeyword.isEmpty) {
      results = _ticketList;
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
    }

    setState(() {
      _search = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          title: Text(
            "Upcoming Flights",
            style: Styles.headLineStyle2,
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
              )),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin:
                EdgeInsets.symmetric(horizontal: AppLayout.getHeight(16)),
                child: TextFormField(
                  onChanged: _runSearch,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      FluentIcons.search_28_regular,
                      color: Color(0xFFBFC205),
                    ),
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Expanded(
                child: TicketsWidget(
                  dir: Axis.vertical,
                  isCheck: true,
                  ticket: _search,
                ),
              ),
            ],
          ),
        ));
  }
}