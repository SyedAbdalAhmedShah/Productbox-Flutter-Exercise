import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/core/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/views/auth/login.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        title: 'ProductBox Flutter Exercise',
        theme: MyThemeData.themeData,
        routes: {},
        home: const LoginPage(),
      ),
    );
  }
}
