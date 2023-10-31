import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:productbox_flutter_exercise/bloc/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository authRepository = AuthRepository();
  void loginUser({required String email, required String username}) async {
    final result =
        await authRepository.getUser(email: email, username: username);
    result.fold(
        (left) => emit(AuthFailureState()), (right) => AuthSuccessState());
  }
}
