import 'package:autolife/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

late YandexMapController controller;
final List<MapObject> mapObjects = [];

final List<Point> avtoservislar = [
  Point(latitude: 41.311081, longitude: 69.240562),
  Point(latitude: 41.315000, longitude: 69.250000),
];

final List<Point> benzinShoxobchalari = [
  Point(latitude: 41.320000, longitude: 69.230000),
  Point(latitude: 41.318000, longitude: 69.245000),
];

final List<Point> doKonlar = [
  Point(latitude: 41.325000, longitude: 69.235000),
  Point(latitude: 41.310000, longitude: 69.255000),
];

void itemOfNavigatorFiltr(BuildContext context) {
  showModalBottomSheet(
    context: context,
    // make background transparent so we can use rounded corners container
    backgroundColor: Colors.transparent,
    isScrollControlled: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      final height = MediaQuery.of(ctx).size.height * 0.4; // kichik balandlik
      return Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Color.fromRGBO(35, 45, 75, 1),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chiziqcha - indicator
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            Text(
              'Tanlang',
              style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),

            // Tugmalar (ikonka bilan)
            Expanded(
              child: ListView(
                children: [
                  _sheetButton(
                    ctx,
                    icon: LucideIcons.wrench,
                    label: 'Avto Xizmatlar',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _sheetButton(
                    ctx,
                    icon: Icons.local_gas_station,
                    label: "Yoqilg\'i Shaxobchalari",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _sheetButton(
                    ctx,
                    icon: Icons.local_parking,
                    label: "Avtomobil To\'xtash Manzillari",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _sheetButton(
                    ctx,
                    icon: Icons.electric_car,
                    label: "Elektr Avtomobil Quvvatlash Shaxobchalari",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _sheetButton(BuildContext context,
    {required IconData icon,
    required String label,
    required VoidCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              color: Colors.redAccent,
              icon,
              size: 22,
            ),
            SizedBox(width: 12),
            Text(label,style: TextStyle(color: Colors.redAccent),),
          ],
        ),
      ),
    ),
  );
}





