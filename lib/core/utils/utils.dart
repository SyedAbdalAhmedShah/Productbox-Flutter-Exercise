import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/upload_document_cubit/upload_document_cubit.dart';
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

  static showCameraGalleryBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.px),
                topRight: Radius.circular(15.px))),
        builder: (ctx) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () => BlocProvider.of<UploadDocumentCubit>(context)
                      .capturePicker(context),
                  leading: Icon(Icons.camera_alt_outlined,
                      color: Theme.of(context).primaryColorDark, size: 5.h),
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text(
                    AppStrings.camera,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: () => BlocProvider.of<UploadDocumentCubit>(context)
                      .galleryFile(context),
                  leading: Icon(
                    Icons.photo,
                    color: Theme.of(context).primaryColorDark,
                    size: 5.h,
                  ),
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text(
                    AppStrings.file,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ));
  }
}
