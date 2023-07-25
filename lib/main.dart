import 'package:flutter/material.dart';
import 'package:ticketbookingapp/Screens/profile.dart';
import 'package:ticketbookingapp/Screens/search.dart';
import 'package:ticketbookingapp/Screens/ticket.dart';
import 'package:ticketbookingapp/utils/routes.dart';
import 'Screens/bottom_bar.dart';
import 'Screens/home.dart';
import 'Screens/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Ticket Booking App',
        home: BottomBar(),
    initialRoute: MyRoutes.loginroute,
    routes: {
      // "/":(context)=> HomeScreen(),
      MyRoutes.bottombtnroute:(context)=>BottomBar(),
      MyRoutes.homeroute:(context)=>HomeScreen(),
      MyRoutes.loginroute:(context)=>LoginPage(),
      MyRoutes.ticketroute:(context)=>TicketScreen(),
      MyRoutes.searchroute:(context)=>SearchScreen(),
      MyRoutes.profileroute:(context)=>ProfileScreen(),


    },

    );

  }
}
