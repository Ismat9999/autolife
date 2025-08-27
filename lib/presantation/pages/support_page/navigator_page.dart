import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../core/theme/app_colors.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  late YandexMapController controller;

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
            padding: EdgeInsets.all(2),
            color: Colors.black,
            child: YandexMap(
              onMapCreated: (YandexMapController yController) async {
                controller = yController;
                await controller.moveCamera(
                  CameraUpdate.newCameraPosition(
                    const CameraPosition(
                      target: Point(latitude: 41.3111, longitude: 69.2797),
                      zoom: 12,
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black12,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 8,
                          ),
                        ],
                        border: Border.all(width: 2, color: Colors.grey),
                      ),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(EvaIcons.search,
                              size: 25, color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white24),
                          suffixIcon: Icon(
                            EvaIcons.close,
                            color: Colors.white24,
                          ),
                        ),
                        cursorColor: Colors.grey.shade400,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: Center(child: Text("Filtr")),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: 8, left: 8, bottom: 8),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.wrench,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.fuel,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.circle_parking,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.settings,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
