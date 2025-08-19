import 'package:autolife/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';

class WBornDateInputText extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String errorText;

  const WBornDateInputText(
      {super.key,
      required this.controller,
      this.onChanged,
      required this.errorText});

  @override
  State<WBornDateInputText> createState() => _WBornDateInputTextState();
}

class _WBornDateInputTextState extends State<WBornDateInputText> {
  final bornDateFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'\d')},
      type: MaskAutoCompletionType.lazy);

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (pickedDate != null) {
      final formatted = DateFormat('dd/MM/yyyy').format(pickedDate);
      widget.controller.text = formatted;
      widget.onChanged?.call(formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [bornDateFormatter],
                  decoration: const InputDecoration(
                    hintText: 'DD/MM/YYYY',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: AppColors.grayColor),
                    isCollapsed: true,
                  ),
                  onChanged: widget.onChanged,
                  style: TextStyle(
                    fontSize: 16.spMin,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              IconButton(
                onPressed: _selectDate,
                icon: const Icon(
                  Icons.calendar_month,
                  color: AppColors.mainColor,
                ),
              )
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
