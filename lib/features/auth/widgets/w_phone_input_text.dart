import 'package:autolife/core/constants/constants.dart';
import 'package:autolife/core/theme/app_colors.dart';
import 'package:autolife/core/utils/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class WPhoneInputText extends StatelessWidget {
  final TextEditingController controller;
  final String errorText;
  final Function(String)? onChanged;
  final MaskTextInputFormatter phoneFormatter;

  const WPhoneInputText({
    super.key,
    required this.controller,
    required this.errorText,
    required this.phoneFormatter,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 56.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(12.0.r)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "+998  |",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.spMin,
                    fontFamily: Constants.exo),
              ),
              SizeBoxes.wSizeBox8,
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [phoneFormatter],
                  decoration: const InputDecoration(
                    hintText: '(__) ___-__-__',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: AppColors.grayColor, fontFamily: Constants.exo),
                    isCollapsed: true,
                  ),
                  style: TextStyle(
                      fontSize: 16.spMin,
                      color: AppColors.whiteColor,
                      fontFamily: Constants.exo),
                ),
              )
            ],
          ),
        ),
        Text(
          errorText,
          style: TextStyle(
              fontSize: 14.spMin,
              color: AppColors.errorColor,
              fontFamily: Constants.exo),
        )
      ],
    );
  }
}
