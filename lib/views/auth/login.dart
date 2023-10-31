import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:productbox_flutter_exercise/core/components/app_button.dart';
import 'package:productbox_flutter_exercise/core/components/custom_gap.dart';
import 'package:productbox_flutter_exercise/core/constants/app_colors.dart';
import 'package:productbox_flutter_exercise/core/constants/app_strings.dart';
import 'package:productbox_flutter_exercise/core/utils/utils.dart';
import 'package:productbox_flutter_exercise/core/utils/validators.dart';
import 'package:productbox_flutter_exercise/views/auth/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

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
              CustomGap(height: 4.h),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailureState) {
                    Utils.showGenericErrorDialog(
                        context: context, message: state.message);
                  }
                },
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return Form(
                      key: authCubit.formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: authCubit.emailController,
                            hint: AppStrings.email,
                            validator: AppValidators.emailValidator,
                          ),
                          const CustomGap(),
                          CustomTextField(
                            controller: authCubit.passwordController,
                            hint: AppStrings.password,
                            obscureText: true,
                            validator: AppValidators.passwordValidator,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const CustomGap(),
              AppButton(onTap: () {
                if (authCubit.formKey.currentState?.validate() ?? false) {
                  authCubit.loginUser();
                } else {}
              }),
              const CustomGap(),
              Text(
                AppStrings.forgotPassword,
                style: TextStyle(color: AppColors.greyColor.withOpacity(0.5)),
              ),
              CustomGap(height: 5.h),
              Text(
                AppStrings.registerHere,
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
