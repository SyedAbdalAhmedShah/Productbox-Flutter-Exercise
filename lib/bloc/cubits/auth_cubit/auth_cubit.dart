import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:productbox_flutter_exercise/bloc/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository authRepository = AuthRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = "";
  bool isUserFind = false;
  void loginUser() async {
    emit(AuthLoadingState());

    final result = await authRepository.getUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    result.fold(
        (failure) => errorMessage = failure.message, (r) => isUserFind = r);
    log('=====================> $isUserFind');
    if (result.isRight()) {
      emit(AuthSuccessState());
    } else {
      emit(AuthFailureState(message: errorMessage));
    }
  }
}
