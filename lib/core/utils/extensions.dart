import 'package:flutter/cupertino.dart';

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
}

extension RoutePoping on BuildContext {
  pop() {
    Navigator.of(this).pop();
  }
}
