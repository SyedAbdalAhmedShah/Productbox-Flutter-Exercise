import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/upload_document_cubit/upload_document_cubit.dart';
import 'package:productbox_flutter_exercise/core/components/app_button.dart';
import 'package:productbox_flutter_exercise/core/components/custom_gap.dart';
import 'package:productbox_flutter_exercise/core/constants/app_colors.dart';
import 'package:productbox_flutter_exercise/core/constants/app_strings.dart';
import 'package:productbox_flutter_exercise/core/utils/utils.dart';
import 'package:productbox_flutter_exercise/views/upload_user_info_screen/widgets/upload_bar.dart';
import 'package:productbox_flutter_exercise/views/upload_user_info_screen/widgets/upload_document_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UploadUserInfoPage extends StatelessWidget {
  const UploadUserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final documentCubit = BlocProvider.of<UploadDocumentCubit>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.uploadDocument,
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
              ),
              const CustomGap(),
              const UploadBar(),
              const CustomGap(),
              BlocBuilder<UploadDocumentCubit, UploadDocumentState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Column(
                        children: List.generate(
                            Utils.uploadDocCardNames.length,
                            (index) => UploadDocumentCard(
                                  index: index,
                                  pickedImage: [
                                    documentCubit.profilePicture,
                                    documentCubit.drivingLicense,
                                    documentCubit.certificate,
                                    documentCubit.passport
                                  ],
                                )),
                      ),
                      const CustomGap(),
                      AppButton(
                          onTap:
                              documentCubit.uploadFileIndex < 4 ? null : () {}),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
