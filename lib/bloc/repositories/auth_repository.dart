import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:productbox_flutter_exercise/core/constants/app_strings.dart';
import 'package:productbox_flutter_exercise/core/failure/failure.dart';
import 'package:productbox_flutter_exercise/models/user_model.dart';

class AuthRepository {
  Future<Either<Failure, bool>> getUser(
      {required String email, required String password}) async {
    final String _apiUrl = 'https://jsonplaceholder.typicode.com/users';
    try {
      final response = await http.get(Uri.parse(_apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<User> allUsers = jsonData.map((e) => User.fromJson(e)).toList();
        bool isUser = allUsers.any(
            (element) => element.email == email && element.email == password);
        if (isUser) {
          return Right(true);
        } else {
          return Left(
              Failure(message: AppStrings.userNotFound, statusCode: 200));
        }
      } else {
        return left(
            Failure(message: AppStrings.somethingWentWrong, statusCode: 400));
      }
    } on SocketException catch (socketError) {
      return left(Failure(message: socketError.message, statusCode: 500));
    } catch (error) {
      log("Error is $error");
      return left(Failure(message: error.toString(), statusCode: 400));
    }
  }
}
