import 'dart:math';

import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/core/constants/app_colors.dart';
import 'package:productbox_flutter_exercise/core/constants/app_strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20.w / pi)),
      child: Text(
        AppStrings.loginButtonText,
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
