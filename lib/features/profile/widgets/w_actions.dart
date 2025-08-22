import 'package:autolife/core/constants/constants.dart';
import 'package:autolife/core/theme/app_colors.dart';
import 'package:autolife/core/utils/sized_boxes.dart';
import 'package:flutter/material.dart';

class WActions extends StatelessWidget {
  final Icon icon;
  final String actionName;
  final Color iconColor;
  final Color nameColor;

  const WActions(
      {super.key,
      required this.icon,
      required this.actionName,
      this.iconColor = AppColors.whiteColor,
      this.nameColor = AppColors.whiteColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Icon(
            icon.icon,
            color: iconColor,
          ),
          SizeBoxes.wSizeBox8,
          Text(
            actionName,
            style: TextStyle(
                color: nameColor,
                fontSize: 16.0,
                fontFamily: Constants.exo,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
