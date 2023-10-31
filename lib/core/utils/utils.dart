import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/core/components/custom_gap.dart';
import 'package:productbox_flutter_exercise/core/constants/app_strings.dart';
import 'package:productbox_flutter_exercise/core/utils/extensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Utils {
  static List<String> uploadDocCardNames = [
    AppStrings.profilePhoto,
    AppStrings.drivingLicense,
    AppStrings.certificate,
    AppStrings.passport,
  ];
  static showGenericErrorDialog(
      {required BuildContext context, String? message, Function()? onPressed}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp)),
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              insetPadding:
                  EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              scrollable: true,
              actions: [
                InkWell(
                    onTap: () => context.pop(), child: Chip(label: Text('Ok')))
              ],
              content: Center(
                child: Column(
                  children: [
                    const CustomGap(),
                    Text(
                      message ?? "Something went wrong, Please try again",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorLight),
                    ),
                  ],
                ),
              ),
            ));
  }
}
