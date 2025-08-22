import 'package:autolife/core/theme/app_colors.dart';
import 'package:autolife/core/utils/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../core/constants/constants.dart';
import '../widgets/w_born_date_input_text.dart';
import '../widgets/w_input_password_text.dart';
import '../widgets/w_input_text.dart';
import '../widgets/w_loading_button.dart';
import '../widgets/w_phone_input_text.dart';

class EnterUserInfoPage extends StatefulWidget {
  final String email;

  const EnterUserInfoPage({super.key, required this.email});

  @override
  State<EnterUserInfoPage> createState() => _EnterUserInfoPageState();
}

class _EnterUserInfoPageState extends State<EnterUserInfoPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bornDateController = TextEditingController();

  final Map<String, String> errors = {
    "userName": "",
    "phoneNumber": "",
    "password": "",
    "bornDate": "",
  };
  final Map<String, bool> isValid = {
    "userName": false,
    "phoneNumber": false,
    "password": false,
    "bornDate": false,
  };

  final MaskTextInputFormatter _phoneFormatter = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void initState() {
    super.initState();
    userNameController.addListener(() => _validateField(
          "userName",
          userNameController.text.trim(),
          (value) => value.isEmpty
              ? ""
              : (value.length < 5 ? "Foydalanuvchi nomi most emas" : null),
        ));
    phoneNumberController.addListener(() => _validateField(
          "phoneNumber",
          phoneNumberController.text.trim(),
          (value) => value.isEmpty
              ? ""
              : (value.length < 14 ? "Telefon raqam formati most emas" : null),
        ));
    passwordController.addListener(() => _validateField(
          "password",
          passwordController.text.trim(),
          (value) => value.isEmpty
              ? ""
              : (value.length < 8 ? "Parol most emas" : null),
        ));
    bornDateController.addListener(() => _validateField(
          "bornDate",
          bornDateController.text.trim(),
          (value) => value.isEmpty
              ? ""
              : (value.length < 10 ? "Sanani to'g'ri kiriting" : null),
        ));
  }

  void _validateField(
      String key, String value, String? Function(String) validator) {
    final error = validator(value);
    setState(() {
      errors[key] = error ?? "";
      isValid[key] = error == null && value.isNotEmpty;
    });
  }

  String normalizePhoneNumber(String formattedNumber) {
    final digitsOnly = formattedNumber.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length != 9) {
      throw FormatException('Noto‘g‘ri format: $formattedNumber');
    }
    return '998$digitsOnly';
  }

  bool _isPressed() => isValid.values.every((e) => e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizeBoxes.hSizeBox32,
                  Text(
                    "Barcha maydonlarni to'ldiring",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18.spMin,
                      fontFamily: Constants.exo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizeBoxes.hSizeBox16,
                  WInputText(
                    controller: userNameController,
                    textInputType: TextInputType.text,
                    hitText: "Foydalanuvchi nomi",
                    errorText: errors["userName"]!,
                  ),
                  SizeBoxes.hSizeBox4,
                  WPhoneInputText(
                    controller: phoneNumberController,
                    errorText: errors["phoneNumber"]!,
                    phoneFormatter: _phoneFormatter,
                  ),
                  SizeBoxes.hSizeBox4,
                  Container(
                    width: double.infinity,
                    height: 56.0.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      widget.email,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16.spMin,
                        fontFamily: Constants.exo,
                      ),
                    ),
                  ),
                  SizeBoxes.hSizeBox20,
                  WInputPasswordText(
                    controller: passwordController,
                    errorText: errors["password"]!,
                  ),
                  SizeBoxes.hSizeBox4,
                  WBornDateInputText(
                    controller: bornDateController,
                    errorText: errors["bornDate"]!,
                  )
                ],
              ),
            ),
            WLoadingButton(
              onPressed: () {
              },
              buttonTitle: "Ro'yxatdan o'tish",
              isPressed: _isPressed(),
            ),
          ],
        ),
      ),
    );
  }
}
