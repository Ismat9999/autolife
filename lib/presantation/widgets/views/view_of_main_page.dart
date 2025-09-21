import 'package:autolife/presantation/blocs/main_bloc/auto_scrool_bloc.dart';
import 'package:autolife/presantation/blocs/main_bloc/auto_scrool_event.dart';
import 'package:autolife/presantation/widgets/items/item_of_auto_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/main_bloc/auto_scrool_state.dart';
import '../../blocs/main_bloc/main_bloc.dart';
import '../items/item_of_auto_category.dart';
import '../items/item_of_auto_parking.dart';
import '../items/item_of_fuel.dart';
import '../items/item_of_fueling_category.dart';
import '../items/item_of_parking_category.dart';

Widget viewOfmainPage(BuildContext context, MainBloc mainBloc,
    AutoScrollBloc autoscroolBloc, bool isLoading) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: itemOfAutoCategory(context),
            ),
            SizedBox(height: 15),
            Container(
              height: 160,
              child: BlocBuilder<AutoScrollBloc, AutoScrollState>(
                  builder: (context, state) {
                return ListView.builder(
                    controller: autoscroolBloc.scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return itemOfAutoService(context, autoscroolBloc);
                    });
              }),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: itemOfFuelingCategory(context),
            ),
            SizedBox(
              height: 15,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return itemOfFuel(context, index);
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: itemOfParkingCategory(context),
            ),
            SizedBox(
              height: 15,
            ),
            ...List.generate(3, (index) => itemOfParking(context, index)),
          ],
        ),
        mainBloc.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox.shrink(),
      ]),
    ),
  );
}
