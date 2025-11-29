import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../core/theme/app_colors.dart';
import '../items/item_of_navigator_filtr.dart';

Widget viewOfDetailsPage(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(
                    image: AssetImage("assets/images/ic_person.png"),
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tashkilot Nomi",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "12/09/2025",
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          ),
        ],
      ),
      Divider(
        color: Colors.white54,
      ),
      Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Telefon:",
                  style: TextStyle(color: Colors.white54),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "+998999966696",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
            Row(
              children: [
                Text(
                  "Manzil:",
                  style: TextStyle(color: Colors.white54),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Kichik Xalqa Yo'li 4/1blok 4-AvtoSalon",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Colors.white),
        ),
        clipBehavior: Clip.hardEdge,
        child: YandexMap(
          scrollGesturesEnabled: false,
          zoomGesturesEnabled: false,
          onMapCreated: (YandexMapController mapController) async {
            controller = mapController;
            await controller
                .moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: Point(latitude: 41.3111, longitude: 69.2797),
            )));
          },
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Izoh",
            style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.white54,
          ),
          Container(
            width: double.infinity,
            child: Text(
              "Avtomobilingizga ishonchli xizmat qidiryapsizmi? Bizning avto servis — sifatli ta’mir, tezkor xizmat va kafolatli natija! Mashinangiz biz bilan doimo yo‘lda!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Text(
            "Reyting:",
            style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.star,
            size: 20,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 20,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 20,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 20,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 20,
            color: Colors.amber,
          ),
          SizedBox(width: 3,),
          Text(
            "5.0",
            style: TextStyle(color: Colors.white54),
          )
        ],
      ),
    ],
  );
}
