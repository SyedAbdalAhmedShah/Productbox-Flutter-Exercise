import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/dashboar_cubit/dashboard_cubit.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/upload_document_cubit/upload_document_cubit.dart';
import 'package:productbox_flutter_exercise/core/config/routing.dart';
import 'package:productbox_flutter_exercise/core/constants/route_name.dart';
import 'package:productbox_flutter_exercise/core/constants/theme_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => AuthCubit()),
        BlocProvider(create: (ctx) => UploadDocumentCubit()),
        BlocProvider(create: (ctx) => DashboardCubit()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) => MaterialApp(
          title: 'ProductBox Flutter Exercise',
          theme: MyThemeData.themeData,
          routes: AppRouting.routes,
          initialRoute: RouteNames.initialRoute,
        ),
      ),
    );
  }
}
