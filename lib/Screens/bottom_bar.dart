import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticketbookingapp/Screens/profile.dart';
import 'package:ticketbookingapp/Screens/search.dart';
import 'package:ticketbookingapp/Screens/ticket.dart';
import 'home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedindex=3;
  final List<Widget> _widgets=<Widget>[
    HomeScreen(),
    SearchScreen(),
    TicketScreen(),
    ProfileScreen(),


  ];
  void onItemTapped(int index){
    setState(() {

      _selectedindex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("My Tickets"),
        //   centerTitle: true,
        //   backgroundColor: Colors.greenAccent,
        // ),
        body: Center(child: _widgets[_selectedindex]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedindex,
          onTap: onItemTapped,
          elevation: 10,
          selectedItemColor: Colors.blueGrey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          // to stop the moving animation of the bottom bar use
          // type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.home_28_regular),
                activeIcon: Icon(FluentIcons.home_28_filled),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.search_28_regular),
                activeIcon: Icon(FluentIcons.search_28_filled),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.ticket_diagonal_28_regular),
                activeIcon: Icon(FluentIcons.ticket_diagonal_28_filled),
                label: "Tickets"),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.person_28_regular),
                activeIcon: Icon(FluentIcons.person_28_filled),
                label: "Profile"),
          ],
        ),
      ),
    );
  }
}
