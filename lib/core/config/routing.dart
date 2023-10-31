import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/core/constants/route_name.dart';
import 'package:productbox_flutter_exercise/views/auth/login.dart';
import 'package:productbox_flutter_exercise/views/upload_user_info_screen/upload_user_info.dart';
import 'package:productbox_flutter_exercise/views/web_sockets/web_sockets_screen.dart';

class AppRouting {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    RouteNames.initialRoute: (ctx) => LoginPage(),
    RouteNames.uploadUserInfoRoute: (ctx) => UploadUserInfoPage(),
    RouteNames.webSocketsRoute: (ctx) => WebsocketPage(),
  };
}
