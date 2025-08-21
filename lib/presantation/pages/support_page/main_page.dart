import 'dart:async';

import 'package:autolife/domain/model/auto_service_model.dart';
import 'package:autolife/presantation/widgets/items/item_of_auto_category.dart';
import 'package:autolife/presantation/widgets/items/item_of_auto_parking.dart';
import 'package:autolife/presantation/widgets/items/item_of_auto_service.dart';
import 'package:autolife/presantation/widgets/items/item_of_fuel.dart';
import 'package:autolife/presantation/widgets/items/item_of_parking_category.dart';
import 'package:flutter/material.dart';

import '../../widgets/items/item_of_fueling_category.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ScrollController _scrollController;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController= ScrollController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset;
        double itemWidth= MediaQuery.of(context).size.width;

        if (currentScroll >= maxScroll) {
          // Reset to beginning
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          setState(() => _currentIndex = 0);
        } else {
          // Scroll to next item
          _scrollController.animateTo(
            currentScroll+ itemWidth,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          setState(() => _currentIndex++);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
        Color.fromRGBO(35, 45, 75, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: itemOfAutoCategory(context),
            ),
            SizedBox(height: 15),
            Container(
              height: 160,
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  itemOfAutoService(context),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: itemOfFuelingCategory(context),
            ),
            SizedBox(height: 15,),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return itemOfFuel(context,index);
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: itemOfParkingCategory(context),
            ),
            SizedBox(height: 15,),
            ...List.generate(3, (index) => itemOfParking(context, index)),

          ],
        ),
      ),
    );
  }
}
