import 'package:autolife/core/constants/constants.dart';
import 'package:autolife/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WLoadingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isPressed;
  final String buttonTitle;

  const WLoadingButton(
      {super.key,
      required this.onPressed,
      this.isPressed = false,
      required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.0.h,
      child: ElevatedButton(
        onPressed: isPressed ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isPressed ? AppColors.blueColor : AppColors.mainColor,
          foregroundColor:
              isPressed ? AppColors.whiteColor : AppColors.grayColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0.r),
          ),
          textStyle: TextStyle(
              fontSize: 18.spMin,
              fontWeight: FontWeight.bold,
              fontFamily: Constants.exo),
        ),
        child: Text(
          buttonTitle,
        ),
      ),
    );
  }
}
