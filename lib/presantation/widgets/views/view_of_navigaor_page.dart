 import 'package:autolife/presantation/blocs/navigator_bloc/navigator_bloc.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../items/item_of_navigator_filtr.dart';

Widget viewOfNavigatorPage(BuildContext context,NavigatorBloc navigatorBloc,bool isLoading){
  return Scaffold(
    body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(2),
          color: Colors.black,
          child: YandexMap(
            onMapCreated: (controller) {
              navigatorBloc.ycontroller = controller;
              navigatorBloc.ycontroller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: Point(latitude: 41.317772,  longitude: 69.230465),zoom: 12)));
            },
            // onUserLocationAdded: (view) async {
            //   return view.copyWith(
            //     pin: view.pin.copyWith(
            //       icon: PlacemarkIcon.single(
            //         PlacemarkIconStyle(
            //           image:BitmapDescriptor.fromAssetImage(
            //               "assets/images/locuser.png"),
            //         ),
            //       ),
            //     ),
            //   );
            // },
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        itemOfNavigatorFiltr(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.list),
                            Text("Filtr"),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: (){
                          navigatorBloc.NavigatorToggleUserLocation(context);
                        },
                        icon: Icon(
                          EvaIcons.navigation,
                          size: 25,
                          color: Colors.amber,
                        )),
                  ],
                ),
              ]
          ),
        ),
        navigatorBloc.isLoading ? Center(child: CircularProgressIndicator(),):SizedBox.shrink(),
      ],
    ),
  );
}