import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/upload_document_cubit/upload_document_cubit.dart';
import 'package:productbox_flutter_exercise/core/constants/app_colors.dart';
import 'package:productbox_flutter_exercise/core/constants/assets.dart';
import 'package:productbox_flutter_exercise/core/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UploadDocumentCard extends StatelessWidget {
  final int index;
  final List<File?>? pickedImage;

  const UploadDocumentCard({required this.index, this.pickedImage, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadDocumentCubit, UploadDocumentState>(
      builder: (context, state) {
        return InkWell(
          onTap: () => Utils.showCameraGalleryBottomSheet(context),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(25.px)),
            margin: EdgeInsets.symmetric(vertical: 1.h),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
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
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: Image(
                    image: pickedImage != null && pickedImage![index] != null
                        ? FileImage(pickedImage![index]!) as ImageProvider
                        : AssetImage(
                            Assets.noImage,
                          ),
                    height: 4.h,
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
