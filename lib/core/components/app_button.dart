import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:productbox_flutter_exercise/core/constants/app_colors.dart';
import 'package:productbox_flutter_exercise/core/constants/app_strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppButton extends StatelessWidget {
  final Function()? onTap;
  const AppButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        print("AUTH STATE IS $state");
        return InkWell(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            width: state is AuthLoadingState ? 20.w : 100.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: state is AuthLoadingState ? 1.h : 1.5.h,
                horizontal: 2.w),
            decoration: BoxDecoration(
                color: onTap != null
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.w / pi)),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: state is AuthLoadingState
                  ? CircularProgressIndicator.adaptive()
                  : Text(
                      AppStrings.loginButtonText,
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        );
      },
    );
  }
}
