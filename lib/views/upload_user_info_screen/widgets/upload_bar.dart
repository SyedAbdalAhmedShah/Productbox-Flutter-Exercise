import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/core/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UploadBar extends StatelessWidget {
  const UploadBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          Utils.uploadDocCardNames.length,
          (index) => AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                height: 1.h,
                width: 15.w,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15.px)),
              )),
    );
  }
}
