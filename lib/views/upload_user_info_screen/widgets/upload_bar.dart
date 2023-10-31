import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/upload_document_cubit/upload_document_cubit.dart';
import 'package:productbox_flutter_exercise/core/constants/app_colors.dart';
import 'package:productbox_flutter_exercise/core/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UploadBar extends StatelessWidget {
  const UploadBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadCubit = BlocProvider.of<UploadDocumentCubit>(context);
    return BlocBuilder<UploadDocumentCubit, UploadDocumentState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              Utils.uploadDocCardNames.length,
              (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    height: 1.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                        color: index < uploadCubit.uploadFileIndex
                            ? Theme.of(context).primaryColor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(15.px)),
                  )),
        );
      },
    );
  }
}
