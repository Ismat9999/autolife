import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../widgets/items/item_of_category.dart';
import '../../widgets/items/item_of_recomended.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "AutoLife",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bo'limlar",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: itemOfCategory(context),
            ),
            SizedBox(height: 10,),
            Text("Rekomendatsiya",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
