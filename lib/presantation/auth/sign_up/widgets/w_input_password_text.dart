import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_colors.dart';

class WInputPasswordText extends StatefulWidget {
  final TextEditingController controller;
  final String errorText;

  const WInputPasswordText(
      {super.key, required this.controller, required this.errorText});

  @override
  State<WInputPasswordText> createState() => _WInputPasswordTextState();
}

class _WInputPasswordTextState extends State<WInputPasswordText> {
  bool isVisible = false;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  obscureText: !isVisible,
                  decoration: InputDecoration(
                    hintText: 'Parolni kiriting',
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
              IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.mainColor,
                  ))
            ],
          ),
        ),
        Text(
          widget.errorText,
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
