import 'package:autolife/core/constants/constants.dart';
import 'package:autolife/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class WDetail extends StatelessWidget {
  final int ordersCount;
  final int favoritesCount;
  final int reviewsCount;

  const WDetail(
      {super.key,
      required this.ordersCount,
      required this.favoritesCount,
      required this.reviewsCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ordersCount.toString(),
                style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20.0,
                    fontFamily: Constants.exo,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Buyurtma",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16.0,
                    fontFamily: Constants.exo),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                favoritesCount.toString(),
                style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20.0,
                    fontFamily: Constants.exo,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Yoqtirganlar",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16.0,
                    fontFamily: Constants.exo),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                reviewsCount.toString(),
                style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20.0,
                    fontFamily: Constants.exo,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Sharhlar",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16.0,
                    fontFamily: Constants.exo),
              )
            ],
          ),
        ],
      ),
    );
  }
}
