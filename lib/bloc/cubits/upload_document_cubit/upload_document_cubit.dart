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
  UploadDocumentRepository _repository = UploadDocumentRepository();
  Future uploadFile() async {
    switch (uploadFileIndex) {
      case 0:
        Either<Failure, List<File>> pickedFiles = await _repository.pickFile();
        pickedFiles.fold((failure) => debugPrint("Failure ${failure.message}"),
            (pickedFiles) => print("PICKED FILE ${pickedFiles.length}"));
        break;
    }
  }
}
