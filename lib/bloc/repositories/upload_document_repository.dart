import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:productbox_flutter_exercise/core/constants/app_strings.dart';
import 'package:productbox_flutter_exercise/core/failure/failure.dart';

class UploadDocumentRepository {
  Future<Either<Failure, List<File>>> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'pdf', 'png'],
          allowMultiple: false);

      if (result != null) {
        List<File> pickedFile = result.paths.map((e) => File(e!)).toList();
        return Right(pickedFile);
      } else {
        return Left(
            Failure(message: AppStrings.fileNotPicked, statusCode: 500));
      }
    } catch (error) {
      log('ERROR IN PICKING FILE $error.');
      return Left(
          Failure(message: AppStrings.somethingWentWrong, statusCode: 500));
    }
  }
}
