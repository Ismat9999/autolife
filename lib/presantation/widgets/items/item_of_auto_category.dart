
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

Widget itemOfAutoCategory(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(width: 12),
          Icon(LucideIcons.wrench, color: Colors.redAccent, size: 20),
          SizedBox(width: 8),
          Text(
            "Avto Servis",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      TextButton(
        onPressed: () {},
        child: Text(
          'Barchasini ko\'rish →',
          style: TextStyle(
            color: Colors.blue[600],
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}