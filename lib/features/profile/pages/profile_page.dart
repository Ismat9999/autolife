import 'package:autolife/core/constants/constants.dart';
import 'package:autolife/core/theme/app_colors.dart';
import 'package:autolife/core/utils/sized_boxes.dart';
import 'package:autolife/features/profile/widgets/w_actions.dart';
import 'package:autolife/features/profile/widgets/w_detail.dart';
import 'package:autolife/features/profile/widgets/w_user_info.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Hisob",
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 24.0,
                  fontFamily: Constants.exo,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizeBoxes.hSizeBox24,
            WUserInfo(
                imageUrl: "https://img.freepik.com/free-photo/handsome-cheerful-man-with-happy-smile_176420-18028.jpg",
                fullName: "Rahmatov Sanjarbek",
                email: "sanjarbekrahmatov2003@gmail.com",
                onEditPressed: () {}),
            SizeBoxes.hSizeBox8,
            const WDetail(ordersCount: 8, favoritesCount: 15, reviewsCount: 5),
            SizeBoxes.hSizeBox16,
            const WActions(
                icon: Icon(Icons.payments), actionName: "Mening buyurtmalarim"),
            SizeBoxes.hSizeBox16,
            const WActions(
                icon: Icon(Icons.favorite_border), actionName: "Yoqtirganlar"),
            SizeBoxes.hSizeBox16,
            const WActions(
                icon: Icon(Icons.list_alt), actionName: "Mening sharhlarim"),
            SizeBoxes.hSizeBox16,
            const WActions(
                icon: Icon(Icons.payment), actionName: "To'lov usuli"),
            SizeBoxes.hSizeBox16,
            const WActions(
                icon: Icon(Icons.settings), actionName: "Sozlamalar"),
            SizeBoxes.hSizeBox16,
            const WActions(
              icon: Icon(Icons.logout),
              actionName: "Ilovadan chiqish",
              iconColor: Colors.red,
              nameColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
