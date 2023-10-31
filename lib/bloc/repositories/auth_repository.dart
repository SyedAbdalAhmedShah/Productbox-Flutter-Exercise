import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:productbox_flutter_exercise/core/failure/failure.dart';
import 'package:productbox_flutter_exercise/models/user_model.dart';

class AuthRepository {
  Future<Either<Failure, User>> getUser(
      {required String email, required String username}) async {
    final String _apiUrl = 'https://jsonplaceholder.typicode.com/users';
    try {
      final response = await http.get(Uri.parse(_apiUrl));
      print('Response ${response.statusCode}');
      if (response.statusCode == 200) {
        return Right(User());
      } else {
        return left(Failure(message: 'not found', statusCode: 400));
      }
    } on SocketException catch (socketError) {
      return left(Failure(message: socketError.message, statusCode: 500));
    } catch (error) {
      log("Error is $error");
      return left(Failure(message: 'not found', statusCode: 400));
    }
  }
}
