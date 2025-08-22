import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget itemOfParking(BuildContext context,int index) {
  final parkings = [
    {'name': 'Mega Planet Parking', 'free': '24', 'total': '20000 ', 'location': 'Yunusobod'},
    {'name': 'Next Parking', 'free': '12', 'total': 'Bepul', 'location': 'Beshyogoch'},
    {'name': 'Mall Parking', 'free': '45', 'total': '5000', 'location': 'Compass'},
  ];

  final colors = [Colors.blue, Colors.green, Colors.yellow,];

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(35, 45, 75, 1),
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(color: colors[index], width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors[index].withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.local_parking,
              color: colors[index],
              size: 24,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  parkings[index]['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on,color: Colors.white,size: 17,),
                    SizedBox(width: 5,),
                    Text(
                      parkings[index]['location']!,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                parkings[index]['free']!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colors[index],
                ),
              ),
              Text(
                '${parkings[index]['total']} som dan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}