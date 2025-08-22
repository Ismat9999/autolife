import 'dart:async';

import 'package:autolife/core/constants/constants.dart';
import 'package:autolife/core/theme/app_colors.dart';
import 'package:autolife/core/utils/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/w_loading_button.dart';
import 'enter_user_info_page.dart';

class EnterConfirmPasswordPage extends StatefulWidget {
  final String email;

  const EnterConfirmPasswordPage({super.key, required this.email});

  @override
  State<EnterConfirmPasswordPage> createState() =>
      _EnterConfirmPasswordPageState();
}

class _EnterConfirmPasswordPageState extends State<EnterConfirmPasswordPage> {
  Timer? _timer;
  int _remainingSeconds = 60;
  String _timeText = '01:00';
  bool isPressed = false;

  List<TextEditingController> _controllers = [];
  List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    startTimer();
    _controllers = List.generate(6, (_) => TextEditingController());
    _focusNodes = List.generate(6, (_) => FocusNode());
  }

  void startTimer() {
    _timer?.cancel();
    _remainingSeconds = 60;
    _updateTimeText();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds--;
        _updateTimeText();
        if (_remainingSeconds <= 0) {
          _timer?.cancel();
        }
      });
    });
  }

  void _updateTimeText() {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    _timeText = '$minutes:$seconds';
  }

  void checkAllFilled() {
    final allFilled = _controllers.every((c) => c.text.length == 1);
    setState(() {
      isPressed = allFilled;
    });
  }

  Widget buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 50.w,
          height: 50.h,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 14.spMin,
                fontFamily: Constants.exo,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              counterText: '',
              hintText: '-',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.grayColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.blueColor,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.grayColor),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < 5) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else {
                  FocusScope.of(context).unfocus();
                }
              } else {
                if (index > 0) {
                  FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                }
              }
              checkAllFilled();
            },
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizeBoxes.hSizeBox24,
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Orqaga",
                      style: TextStyle(
                          color: AppColors.blueColor,
                          fontSize: 16.spMin,
                          fontFamily: Constants.exo,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizeBoxes.hSizeBox32,
                Column(
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      "${maskEmail(widget.email)}  Quyidagi email pochtaga tasdiqlash kodi yuborilni. Pochtangizga o'ting va tasdiqlash kodini bu yerga kiriting",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 14.spMin,
                          fontFamily: Constants.exo),
                    ),
                  ],
                ),
                SizeBoxes.hSizeBox16,
                buildOtpFields(),
                SizeBoxes.hSizeBox16,
                TextButton(
                  onPressed: _timeText == "00:00"
                      ? () {
                          startTimer();
                        }
                      : null,
                  child: _timeText == "00:00"
                      ? const Text(
                          "Kodni qayta olish uchun bosing",
                          style: TextStyle(
                              color: AppColors.blueColor,
                              fontFamily: Constants.exo,
                              fontWeight: FontWeight.bold),
                        )
                      : Text(
                          "Kodni qayta olish $_timeText",
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontFamily: Constants.exo,
                          ),
                        ),
                ),
              ],
            ),
            WLoadingButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EnterUserInfoPage(
                              email: widget.email,
                            )));
              },
              buttonTitle: "Tasdiqlash",
              isPressed: isPressed,
            )
          ],
        ),
      ),
    );
  }

  String maskEmail(String email) {
    if (!email.contains('@')) return email;

    final parts = email.split('@');
    final name = parts[0];
    final domain = parts[1];

    final start = name.substring(0, 2);
    final end = name.substring(name.length - 1);

    return "$start ****** $end@$domain".toLowerCase();
  }

  String getCodeFromFields() {
    return _controllers.map((c) => c.text).join();
  }
}
