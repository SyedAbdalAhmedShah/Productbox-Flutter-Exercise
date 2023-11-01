import 'dart:math';

import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/core/components/custom_gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostCard extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String postImage;
  const PostCard(
      {required this.postImage,
      required this.userName,
      required this.profileImage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 4.w / 2 * pi,
              backgroundImage: AssetImage(profileImage),
            ),
            CustomGap(
              width: 2.w,
            ),
            Text(
              userName,
              style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const CustomGap(),
        Container(
          height: 25.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(postImage), fit: BoxFit.cover)),
        )
      ],
    );
  }
}
