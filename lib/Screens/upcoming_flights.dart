import 'package:flutter/material.dart';
import 'package:ticketbookingapp/Screens/home.dart';

import '../utils/styles.dart';

class UpcomingFlights extends StatelessWidget {
  const UpcomingFlights({super.key});

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
        ),
        body: Center(
          child: TicketsWidget(
            dir: Axis.vertical,
            isCheck: true,
          ),
        ));
  }
}
