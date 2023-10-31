import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:productbox_flutter_exercise/bloc/repositories/upload_document_repository.dart';
import 'package:productbox_flutter_exercise/core/failure/failure.dart';

part 'upload_document_state.dart';

class UploadDocumentCubit extends Cubit<UploadDocumentState> {
  UploadDocumentCubit() : super(UploadDocumentInitial());

  int uploadFileIndex = 0;

  File? profilePicture;
  File? drivingLicense;
  File? certificate;
  File? passport;

  String errorMessage = "";
  UploadDocumentRepository _repository = UploadDocumentRepository();
  Future galleryFile(BuildContext context) async {
    Either<Failure, List<File>> pickedFiles = await _repository.pickFile();
    pickedFiles.fold((failure) => errorMessage = failure.message,
        (pickedFiles) {
      switch (uploadFileIndex) {
        case 0:
          profilePicture = pickedFiles.first;
          uploadFileIndex = uploadFileIndex + 1;
          break;
        case 1:
          drivingLicense = pickedFiles.first;
          uploadFileIndex = uploadFileIndex + 1;
          break;
        case 2:
          certificate = pickedFiles.first;
          uploadFileIndex = uploadFileIndex + 1;
          break;
        case 3:
          passport = pickedFiles.first;
          uploadFileIndex = uploadFileIndex + 1;
      }
    });
    Navigator.pop(context);
    if (pickedFiles.isRight()) {
      emit(CaptureProfilePhotoState());
    } else {
      emit(UploadDocumentFailureState(message: errorMessage));
    }
  }

  Future capturePicker(BuildContext context) async {
    Either<Failure, File> pickedFiles =
        await _repository.captureFileFromCamera();
    pickedFiles.fold((failure) => errorMessage = failure.message,
        (pickedFiles) {
      switch (uploadFileIndex) {
        case 0:
          profilePicture = pickedFiles;
          uploadFileIndex = uploadFileIndex + 1;
          break;
        case 1:
          drivingLicense = pickedFiles;
          uploadFileIndex = uploadFileIndex + 1;
          break;
        case 2:
          certificate = pickedFiles;
          uploadFileIndex = uploadFileIndex + 1;
          break;
        case 3:
          passport = pickedFiles;
          uploadFileIndex = uploadFileIndex + 1;
      }
    });
    Navigator.pop(context);
    if (pickedFiles.isRight()) {
      emit(CaptureProfilePhotoState());
    } else {
      emit(UploadDocumentFailureState(message: errorMessage));
    }
  }
}
