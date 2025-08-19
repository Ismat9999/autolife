import 'package:flutter/material.dart';

Widget itemOfCategory(BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.local_parking,size: 50,color: Colors.blue.shade300,),
                SizedBox(height: 10,),
                Text("Parking",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.local_gas_station,size: 50,color: Colors.blue.shade300,),
                SizedBox(height: 10,),
                Text("Shaxobcha",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.car_repair,size: 50,color: Colors.blue.shade300,),
                SizedBox(height: 10,),
                Text("Servis",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.local_car_wash,size: 50,color: Colors.blue.shade300,),
                SizedBox(height: 10,),
                Text("Avtomoyka",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}