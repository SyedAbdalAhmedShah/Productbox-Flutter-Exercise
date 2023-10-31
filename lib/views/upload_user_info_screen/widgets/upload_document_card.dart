import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/upload_document_cubit/upload_document_cubit.dart';
import 'package:productbox_flutter_exercise/core/constants/app_colors.dart';
import 'package:productbox_flutter_exercise/core/constants/assets.dart';
import 'package:productbox_flutter_exercise/core/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UploadDocumentCard extends StatelessWidget {
  final int index;
  const UploadDocumentCard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final documentCubit = BlocProvider.of<UploadDocumentCubit>(context);
    return InkWell(
      onTap: () => documentCubit.uploadFile(),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(25.px)),
        margin: EdgeInsets.symmetric(vertical: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Utils.uploadDocCardNames[index],
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColorDark),
            ),
            Image(
              image: AssetImage(
                Assets.noImage,
              ),
              height: 3.h,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}
