import 'package:autolife/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 30,
              color: Colors.grey.shade400,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Qidiruv",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    suffixIcon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                  cursorColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
