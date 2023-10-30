import 'dart:math';

import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/core/constants/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const CustomTextField(
      {required this.controller, required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 16.sp, color: AppColors.greyColor),
            contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
            fillColor: AppColors.whiteColor,
            filled: true,
            border: _fieldBorder(),
            focusedBorder: _fieldBorder(),
            enabledBorder: _fieldBorder(),
            disabledBorder: _fieldBorder()));
  }

  InputBorder _fieldBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20.w / pi));
  }
}
