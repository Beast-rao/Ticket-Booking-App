import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketbookingapp/Screens/home.dart';
import 'package:ticketbookingapp/utils/app_list_models.dart';

import '../utils/app_layouts.dart';
import '../utils/styles.dart';

class HotelViewAll extends StatefulWidget {
  @override
  State<HotelViewAll> createState() => _HotelViewAllState();
}

class _HotelViewAllState extends State<HotelViewAll> {
  List<Map<String, dynamic>> _searchotel = [];
  List<Map<String, dynamic>> _hotelLiist = [];

  @override
  void initState() {
    _hotelLiist = hotelList;
    _searchotel = _hotelLiist;
    super.initState();
  }

  void _runSearch(String enterKeyword) {
    List<Map<String, dynamic>> hresults = [];

    if (enterKeyword.isEmpty) {
      hresults = _hotelLiist;
    } else {
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
      _searchotel = hresults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.bColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          title: Text(
            "Hotels",
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(3)),
          child: Column(
            // Use Column instead of ListView
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(16)),
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
                // Use Expanded to allow HotelsWidget to take remaining height
                child: HotelsWidget(
                  isHotelScreen: true,
                  hotel: _searchotel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
