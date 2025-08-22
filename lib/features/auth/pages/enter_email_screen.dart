import 'package:autolife/core/constants/constants.dart';
import 'package:autolife/core/extensions/padding_extension.dart';
import 'package:autolife/core/theme/app_colors.dart';
import 'package:autolife/core/utils/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/w_input_text.dart';
import '../widgets/w_loading_button.dart';
import 'enter_confirm_password_page.dart';

class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({super.key});

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  final TextEditingController emailController = TextEditingController();
  String emailErrorText = "";
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_validateEmail);
  }

  void _validateEmail() {
    final email = emailController.text.trim();
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (email.isEmpty) {
      setState(() {
        emailErrorText = "";
        isPressed = false;
      });
    } else if (!regExp.hasMatch(email)) {
      setState(() {
        emailErrorText = "Email to'g'ri formatda emas";
        isPressed = false;
      });
    } else {
      setState(() {
        emailErrorText = "";
        isPressed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizeBoxes.hSizeBox48,
              Text(
                "Emailni kiriting",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 24.spMin,
                    fontFamily: Constants.exo,
                    fontWeight: FontWeight.bold),
              ).paddingOnly(left: 16.0.w),
              SizeBoxes.hSizeBox24,
              WInputText(
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                hitText: 'Email',
                errorText: emailErrorText,
              ).paddingSymmetric(horizontal: 16.0.w)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WLoadingButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnterConfirmPasswordPage(
                          email: emailController.text.trim()),
                    ),
                  );
                },
                buttonTitle: "Emailni tasdiqlash",
                isPressed: isPressed,
              ).paddingSymmetric(horizontal: 16.0.w),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Agar sizda hisob bo'lsa?",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 14.spMin,
                        fontFamily: Constants.exo),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Kirish",
                        style: TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 14.spMin,
                            fontFamily: Constants.exo),
                      ))
                ],
              ),
              SizeBoxes.hSizeBox8
            ],
          )
        ],
      ),
    );
  }
}
