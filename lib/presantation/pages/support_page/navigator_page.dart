import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../widgets/items/item_of_navigator_filtr.dart';


class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  late YandexMapController ycontroller;

  @override
  void initState() {
    super.initState();

    /// Misol uchun bir nechta zapravka markerlari
    final stations = [
      {"lat": 41.3111, "lng": 69.2797, "price": "6500 UZS"},
      {"lat": 41.3150, "lng": 69.2700, "price": "8200 UZS"},
      {"lat": 41.3000, "lng": 69.2500, "price": "8300 UZS"},
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(2),
            color: Colors.black,
            child: YandexMap(
              onMapCreated: (controller) {
                ycontroller = controller;
                ycontroller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: Point(latitude: 41.317772,  longitude: 69.230465),zoom: 12)));
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
                        onPressed: () async {
                          LocationPermission permission =
                              await Geolocator.checkPermission();
                          if (permission == LocationPermission.denied) {
                            Geolocator.requestPermission();
                          } else if (permission ==
                              LocationPermission.deniedForever) {
                            Geolocator.openAppSettings();
                          }
                          CameraPosition? userPosition=  await ycontroller.getUserCameraPosition();
                          if(userPosition != null) {
                            ycontroller.moveCamera(
                                CameraUpdate.newCameraPosition(
                                    userPosition!));
                          }
                          await ycontroller.toggleUserLayer(
                              visible: true, autoZoomEnabled: true);
                          await ycontroller.moveCamera(CameraUpdate.zoomTo(14));
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
    ],
            ),
          );
  }
}
