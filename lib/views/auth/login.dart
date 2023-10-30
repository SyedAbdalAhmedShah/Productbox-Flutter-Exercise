import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/core/constants/app_colors.dart';
import 'package:productbox_flutter_exercise/core/constants/app_strings.dart';
import 'package:productbox_flutter_exercise/views/components/custom_gap.dart';
import 'package:productbox_flutter_exercise/views/components/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.login,
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold),
              ),
              const CustomGap(),
              CustomTextField(
                  controller: _emailController, hint: AppStrings.email),
              const CustomGap(),
              CustomTextField(
                  controller: _passwordController, hint: AppStrings.password),
            ],
          ),
        ),
      ),
    );
  }
}
