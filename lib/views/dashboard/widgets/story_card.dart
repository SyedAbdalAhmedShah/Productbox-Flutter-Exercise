import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoryCard extends StatelessWidget {
  final String storyImage;
  const StoryCard({required this.storyImage, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: CircleAvatar(
        radius: 6.w / 2 * pi,
        child: CircleAvatar(
          radius: 5.5.w / 2 * pi,
          backgroundColor: Colors.blue,
          backgroundImage: AssetImage(storyImage),
        ),
      ),
    );
  }
}
