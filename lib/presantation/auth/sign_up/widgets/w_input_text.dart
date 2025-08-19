import 'package:autolife/core/constants/constants.dart';
import 'package:autolife/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WInputText extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hitText;
  final String errorText;

  const WInputText(
      {super.key,
      required this.controller,
      required this.textInputType,
      required this.hitText,
      required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 56.0.h,
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: TextField(
            controller: controller,
            keyboardType: textInputType,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: hitText,
              border: InputBorder.none,
              hintStyle: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 16.spMin,
                  fontFamily: Constants.exo),
            ),
            style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 16.spMin,
                fontFamily: Constants.exo),
          ),
        ),
        Text(
          errorText,
          style: TextStyle(
            fontSize: 14.spMin,
            color: AppColors.errorColor,
            fontFamily: Constants.exo,
          ),
        )
      ],
    );
  }
}
