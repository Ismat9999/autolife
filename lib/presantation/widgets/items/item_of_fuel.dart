import 'package:flutter/material.dart';

Widget itemOfFuel(BuildContext context,int index) {
  final gasStations = [
    {'name': 'UzGasOil', 'price': '12,500', 'location': 'Chilonzor'},
    {'name': 'Lukoil', 'price': '12,800', 'location': 'Yunusobod'},
    {'name': 'Shell', 'price': '13,200', 'location': 'Mirzo Ulugbek'},
    {'name': 'Total', 'price': '12,900', 'location': 'Shayxontohur'},
  ];

  final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
  ];

  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.all(5),
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colors[index].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.local_gas_station,
                  color: colors[index],
                  size: 20,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gasStations[index]['name']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      gasStations[index]['location']!,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AI-95',
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 11,
                ),
              ),
              Text(
                '${gasStations[index]['price']} so\'m/L',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colors[index],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}