import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../core/theme/app_colors.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  late YandexMapController controller;
  final List<MapObject> mapObjects = [];

  @override
  void initState() {
    super.initState();

    /// Misol uchun bir nechta zapravka markerlari
    final stations = [
      {"lat": 41.3111, "lng": 69.2797, "price": "6500 UZS"},
      {"lat": 41.3150, "lng": 69.2700, "price": "8200 UZS"},
      {"lat": 41.3000, "lng": 69.2500, "price": "8300 UZS"},
    ];

    for (var s in stations) {
      mapObjects.add(
        PlacemarkMapObject(
          mapId: MapObjectId("station_${s['lat']}"),
          point: Point(latitude: s["lat"] as double, longitude: s["lng"] as double),
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage("assets/fuel.png"), // yonilg'i ikonka
              scale: 0.08,
            ),
          ),
          onTap: (self, point) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Narxi: ${s['price']}")),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Karta
          YandexMap(
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
            mapObjects: mapObjects,
          ),

          /// Bottom panel
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.local_gas_station, color: Colors.blue),
                      SizedBox(height: 4),
                      Text("Шахобча"),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(height: 4),
                      Text("Service"),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.menu, color: Colors.black),
                      SizedBox(height: 4),
                      Text("Меню"),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// Chap pastki filter (masalan, AI-80)
          Positioned(
            left: 16,
            bottom: 90,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.local_gas_station, color: Colors.blue, size: 20),
                  SizedBox(width: 6),
                  Text("AI-80"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
